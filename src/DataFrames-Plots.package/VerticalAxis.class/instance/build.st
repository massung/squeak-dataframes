as yet unclassified
build
	"Builds the tick marks so they may be drawn."
	
	| lo hi step halfStep value tickMaxWidth tickWidth |
	
	lo := index first.
	hi := index last.
	
	"if these are magnitudes, then we calculate steps"
	(lo isNumber and: hi isNumber)
		ifTrue: [
			step := 10 ** ((hi - lo) log rounded - 1).
			halfStep := step / 2.
			
			"the initial value is the previous step before the minimum key"
			self from: (value := lo + step // step - 1 * step).
				
			"increase the step so there are only 4-5 ticks on the axis"
			step := hi - value // step / 5 * step + halfStep // halfStep * halfStep.
			
			"the y-axis extends the maximum range"
			hi := hi + step // step * step.
			
			"generate ticks for each step"
			[ticks at: value put: value] doWhileTrue: [
				(value := value + step) <= (hi + halfStep)
			].
		
			"set the upper limit of the axis"
			self to: hi
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
		
	"calculate the widest tick after rotation"
	tickWidth := tickMaxWidth * self tickRotation cos abs max: tickFont height.
	
	"calculate the new width/height of the axis"
	self width: 10 + tickWidth + label fontToUse height
	