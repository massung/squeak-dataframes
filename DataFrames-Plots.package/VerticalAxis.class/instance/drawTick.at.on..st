as yet unclassified
drawTick: key at: value on: aCanvas

	| tick f labelPos tickPos offset w |

	offset := -5 @ 0.
	tick := self formatTick: key.
	f := self fractionOf: value.
	w := tickFont widthOfString: tick.
	
	"tick and label positions"
	tickPos := figure plots left @ (self pointAt: value).
	labelPos := tickPos + offset + ((w + 3) negated @ ((tickFont height / 2) negated + 1)).
	
	"draw the tick mark and label"
	aCanvas
		line: tickPos to: tickPos + offset width: 1 color: Color gray;
		drawString: tick at: labelPos font: tickFont color: Color black
