as yet unclassified
pointAt: value
	"Returns where on the axis (pixel) a value should be plotted."

	^(figure plots left + 10 + (figure plots width - 20 * (self fractionOf: value))) rounded