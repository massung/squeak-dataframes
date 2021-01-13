as yet unclassified
build
	"Builds the tick marks so they may be drawn."
	
	| lo hi range tickMaxWidth tickWidth |
	
	lo := index keys first.
	hi := index keys last.
	
	"if these are magnitudes, then we calculate steps"
	(lo respondsTo: #to:steps:clamp:)
		ifFalse: [super build]
		ifTrue: [
			ticks := (range := lo to: hi steps: 5 clamp: false) collect: [:value |
				value -> value
			].
		
			self
				from: range first;
				to: range last
		].

	"find the width of the longest tick label"
	tickMaxWidth := ticks
		ifEmpty: [0]
		ifNotEmpty: [
			(ticks collect: [:assoc | tickFont widthOfString: (self formatTick: assoc key)])
				max
		].
		
	"calculate the widest tick after rotation"
	tickWidth := tickMaxWidth * self tickRotation cos abs max: tickFont height.
	
	"calculate the new width/height of the axis"
	self width: 10 + tickWidth + label fontToUse height
	