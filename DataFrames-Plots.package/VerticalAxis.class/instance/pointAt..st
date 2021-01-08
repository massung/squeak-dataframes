as yet unclassified
pointAt: value
	"Returns where on the axis (pixel) a value should be plotted."

	^(figure plots bottom - (figure plots height - 10 * (self fractionOf: value)) - 1) rounded