as yet unclassified
initializeOnFigure: aFigure
	
	super initializeOnFigure: aFigure.
	
	"override morph properties"
	self
		listDirection: #rightToLeft;
		hResizing: #rigid;
		width: 5 + label fontToUse height.
	
	"vertical axis label should be vertical"
	label rotationDegrees: -90