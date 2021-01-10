as yet unclassified
drawOn: aCanvas
	"Render the scatter plot using the owner Figure DataFrame, axes, etc."

	| canvas ypos |
	
	canvas := ClippingCanvas canvas: aCanvas clipRect: owner bounds.
	ypos := self bottom - (self height * (self figure y fractionOf: value)).

	canvas 
		line: (self left @ ypos)
		to: (self right @ ypos)
		width: 2
		color: self color
		dashLength: 10
		secondColor: Color transparent 
		secondDashLength: 5
		startingOffset: 0.
	
	canvas
		drawString: (label ifNil: [value] ifNotNil: [label]) asString
		at: self left @ (ypos - 14)
		font: nil
		color: Color black
