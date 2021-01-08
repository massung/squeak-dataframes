as yet unclassified
addPlot: aClass
	"Create a Plot subclass and add it to this Figure."
	
	| plot frame |
	
	"TODO: ensure aClass is a subclass of Plot"
	
	plot := aClass perform: #onFigure: with: self.
	frame := LayoutFrame
		fractions: (0 @ 0 corner: 1 @ 1) 
		offsets: (Rectangle left: 10 right: -10 top: 5 bottom: 0).
	
	"add a scatter plot morph"
	plots addMorph: plot fullFrame: frame.

	^plot