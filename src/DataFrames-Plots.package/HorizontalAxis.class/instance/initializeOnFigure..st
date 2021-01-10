as yet unclassified
initializeOnFigure: aFigure
	
	super initializeOnFigure: aFigure.
	
	"override morph properties"
	self
		listDirection: #topToBottom;
		vResizing: #rigid;
		height: 5 + label fontToUse height
	