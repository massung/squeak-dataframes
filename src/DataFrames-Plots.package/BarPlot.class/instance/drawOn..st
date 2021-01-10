as yet unclassified
drawOn: aCanvas
	"Render the scatter plot using the owner Figure DataFrame, axes, etc."

	| canvas r w |
	
	canvas := ClippingCanvas canvas: aCanvas clipRect: owner bounds.
	
	"caluclate the half-width of each bar"
	w := self width / figure x series size // 2 - 1.
	w := (w max: 2) min: 8.

	self pointsDo: [:p |
		r := Rectangle left: p x - w right: p x + w top: p y bottom: self bottom.
		canvas fillRectangle: r color: color
	]
