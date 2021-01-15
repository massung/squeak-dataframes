as yet unclassified
indexes
	"Returns a stream of all record indexes in order by key. This will be an association of key -> rowIndexes array. This is better than iterating over keys."
	
	^Generator on: [:g |
		keys withIndexDo: [:key :i | g nextPut: key -> (indexes at: i)]
	]
