as yet unclassified
drawOn: aCanvas
	"Render the scatter plot using the owner Figure DataFrame, axes, etc."

	| canvas xpos |
	
	canvas := ClippingCanvas canvas: aCanvas clipRect: owner bounds.
	xpos := self left + (self width * (self figure x fractionOf: value)).

	canvas 
		line: (xpos @ self top)
		to: (xpos @ self bottom) 
		width: 2
		color: self color
		dashLength: 10
		secondColor: Color transparent 
		secondDashLength: 5
		startingOffset: 0.
	
	canvas
		drawString: (label ifNil: [value] ifNotNil: [label]) asString
		at: xpos @ self top
		font: nil
		color: Color black
