as yet unclassified
drawTick: key at: value on: aCanvas

	| tick tickPos w |

	tick := self formatTick: key.
	w := tickFont widthOfString: tick.
	
	"tick and label positions; account for cell inset of plots"
	tickPos := (self pointAt: value) @ (self top + 5).
	
	"draw the tick mark"
	aCanvas line: tickPos to: tickPos - (0 @ 5) width: 1 color: Color gray.
	
	"draw the tick label"
	tickRotation = 0
		ifTrue: [
			| labelPos |
			
			labelPos := tickPos + (w // -2 @ 3).
			
			"handle overwrite label positions"
			labelPos x < self left ifTrue: [labelPos := self left @ labelPos y].
			labelPos x + w > self right ifTrue: [labelPos := self right - w @ labelPos y].
			
			aCanvas drawString: tick at: labelPos font: tickFont color: Color black
		]
	
		ifFalse: [
			| transform clipRect |
			
			clipRect := tickPos + (tickFont height // -2 @ 2) extent: (tickFont height @ w).
			transform := MatrixTransform2x3 identity
				setOffset: clipRect bottomLeft;
				setAngle: tickRotation.
			
			aCanvas transformBy: transform clippingTo: clipRect during: [:form |
				form
					fillColor: Color white;
					drawString: tick at: 0 @ 0 font: tickFont color: Color black
			]
		]
