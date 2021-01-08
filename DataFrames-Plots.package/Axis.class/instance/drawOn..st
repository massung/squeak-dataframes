as yet unclassified
drawOn: aCanvas

	super drawOn: aCanvas.
	
	"build all the ticks"
	ticks ifEmpty: [
		index
			ifEmpty: [self from: nil; to: nil]
			ifNotEmpty: [self build]
	].

	"render all the ticks"
	ticks keysAndValuesDo: [:key :value |
		self drawTick: key at: value on: aCanvas
	].
