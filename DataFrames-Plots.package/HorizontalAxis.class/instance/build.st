as yet unclassified
build
	"Builds the tick marks so they may be drawn."

	| lo hi step halfStep value tickHeight tickMaxWidth |
	
	lo := min ifNil: [index first].
	hi := max ifNil: [index last].
	
	"if these are magnitudes, then we calculate steps"
	((lo isKindOf: Magnitude) and: (hi isKindOf: Magnitude))
		ifTrue: [
			step := 10 ** ((hi - lo) log rounded - 1).
			halfStep := step / 2.
			
			"the initial tick is at the first rounded step"
			value := lo + step // step * step.
			
			"increase the step so there are only 4-5 ticks on the axis"
			step := hi - value // step / 5 * step + halfStep // halfStep * halfStep.
			
			"generate ticks for each step"
			[ticks at: value put: value] doWhileTrue: [
				(value := value + step) <= (hi + halfStep)
			].
		
			"set the bounds of the axis"
			self from: lo; to: hi
		]
		
		"enumerated ticks"
		ifFalse: [
			index withIndexDo: [:key :i | ticks at: key put: i].
			
			"the index of the key indicates the position along the axis"
			self from: 1; to: index size.
		].

	"find the width of the longest tick label"
	tickMaxWidth := ticks
		ifEmpty: [0]
		ifNotEmpty: [(ticks keys collect: [:key | tickFont widthOfString: (self formatTick: key)]) max].
	
	"calculate the longest tick width and the maximum height (after rotation)"
	tickHeight := tickMaxWidth * tickRotation degreesToRadians sin abs max: tickFont height.
	
	"calculate the new width/height of the axis"
	self height: 15 + tickHeight + label fontToUse height
