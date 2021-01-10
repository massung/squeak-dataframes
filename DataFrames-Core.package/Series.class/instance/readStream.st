as yet unclassified
readStream
	"Returns this series as a stream of row indexes."
	
	^Generator on: [:g |
		primaryIndex do: [:row | g yield: (values at: row)]
	]