as yet unclassified
initializeOnFigure: aFigure

	super initialize.
	
	self
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellInset: 0.
	
	figure := aFigure