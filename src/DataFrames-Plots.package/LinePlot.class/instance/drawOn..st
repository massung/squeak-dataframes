as yet unclassified
drawOn: aCanvas
	"Render the scatter plot using the owner Figure DataFrame, axes, etc."

	| canvas points |
	
	canvas := ClippingCanvas canvas: aCanvas clipRect: owner bounds.
	
	"sort all the points by x"
	points := self points sorted: [:a :b | a x < b x].

	2 to: points size do: [:i |
		canvas line: (points at: i - 1) to: (points at: i) width: 2 color: color
	]
