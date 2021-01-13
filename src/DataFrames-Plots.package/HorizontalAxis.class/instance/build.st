as yet unclassified
build
	"Builds the tick marks so they may be drawn."

	| lo hi range tickHeight tickMaxWidth |
	
	lo := min ifNil: [index keys first].
	hi := max ifNil: [index keys last].
	
	"if these are magnitudes, then we calculate steps"
	(lo respondsTo: #to:steps:clamp:)
		ifFalse: [super build]
		ifTrue: [
			ticks := (range := lo to: hi steps: 5 clamp: false) collect: [:value |
				value -> value
			].
		
			self from: range first; to: hi
		].

	"find the width of the longest tick label"
	tickMaxWidth := ticks
		ifEmpty: [0]
		ifNotEmpty: [
			(ticks collect: [:assoc | tickFont widthOfString: (self formatTick: assoc key)])
				max
		].
	
	"calculate the longest tick width and the maximum height (after rotation)"
	tickHeight := tickMaxWidth * self tickRotation sin abs max: tickFont height.
		
	"calculate the new width/height of the axis"
	self height: 15 + tickHeight + label fontToUse height
