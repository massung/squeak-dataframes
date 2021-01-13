as yet unclassified
drawOn: aCanvas

	super drawOn: aCanvas.
	
	"build all the ticks"
	ticks ifEmpty: [
		index keys
			ifEmpty: [self from: nil; to: nil]
			ifNotEmpty: [self build]
	].

	"render all the ticks"
	ticks do: [:assoc |
		self drawTick: assoc key at: assoc value on: aCanvas
	].
