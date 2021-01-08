as yet unclassified
drawOn: aCanvas
	"Render the scatter plot using the owner Figure DataFrame, axes, etc."

	| canvas |
	
	canvas := ClippingCanvas canvas: aCanvas clipRect: owner bounds.

	self pointsDo: [:p |
		canvas
			fillOval: (p - (size @ size) extent: (size * 2) @ (size * 2))
			color: color
	]