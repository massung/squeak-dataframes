as yet unclassified
tickRotation
	"Returns the angle of rotation (in radians) of each tick label."
	
	^tickOrientation = #horizontal
		ifTrue: [0]
		ifFalse: [Float pi / -2]