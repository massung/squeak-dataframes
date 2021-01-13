as yet unclassified
initializeOnFigure: aFigure
	"The axis should be #x or #y."

	super initialize.
	
	figure := aFigure.
	label := StringMorph new.
	ticks := Array new.
	tickFont := StrikeFont familyName: (label fontToUse familyName) size: (label fontToUse pointSize // 2).
	tickOrientation := #horizontal.
	tickFormat := nil.
	
	"where the label is framed"
	ticksMorph := RectangleMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color transparent;
		borderColor: Color transparent;
		borderWidth: 0.
	
	"if this is the #x axis, then fill horizontally, and fix the height"
	self
		layoutPolicy: TableLayout new;
		listCentering: #center;
		wrapCentering: #center;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color white;
		borderWidth: 0;
		addMorphBack: ticksMorph;
		addMorphBack: label
	

	