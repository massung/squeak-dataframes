as yet unclassified
at: key
	"Returns a stream of indexes matching a given key in the b-tree."
	
	^self at: key ifAbsent: [ReadStream on: #()]
