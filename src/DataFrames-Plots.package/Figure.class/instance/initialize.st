as yet unclassified
initialize

	super initialize.
	self
		extent: 480 @ 320;
		setBorderStyle: #complexRaised;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		listCentering: #topLeft;
		wrapCentering: #center;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellInset: 0;
		cellGap: 0;
		color: Color white.
	
	"create the axes with default columns"
	x := HorizontalAxis new initializeOnFigure: self.
	y := VerticalAxis new initializeOnFigure: self.
	
	"create the plots area"
	plots := BorderedMorph new
		layoutPolicy: ProportionalLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		color: Color white;
		borderColor: Color gray;
		cellInset: 0;
		borderWidth: 1.
	
	"add the y-axis and a transparent morph, then add the plots and x-axis"
	self
		addMorphBack: (RectangleMorph new
			layoutPolicy: TableLayout new;
			listDirection: #topToBottom;
			listCentering: #topLeft;
			wrapCentering: #center;
			hResizing: #shrinkWrap;
			vResizing: #spaceFill;
			color: Color white;
			borderColor: Color transparent;
			addMorphBack: y;
			addMorphBack: (Morph new color: Color transparent)
		);
		addMorphBack: (RectangleMorph new
			layoutPolicy: TableLayout new;
			listDirection: #topToBottom;
			listCentering: #topLeft;
			wrapCentering: #center;
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			color: Color white;
			borderColor: Color transparent;
			addMorphBack: plots;
			addMorphBack: x
		).
	