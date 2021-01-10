as yet unclassified
mean
	"Returns the average of all the keys. This assumes the keys are numeric."
	
	| total n |
	
	total := 0.
	n := 0.
	
	keys withIndexDo: [:key :i |
		total := total + key.
		n := n + (indexes at: i) size.
	].
	
	^total / n
	