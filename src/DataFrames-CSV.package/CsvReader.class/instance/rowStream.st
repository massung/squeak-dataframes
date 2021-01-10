as yet unclassified
rowStream
	"Returns a stream that produces all the rows."
	
	| row |
	
	^Generator on: [:g |
		[row := self nextRow] whileNotNil: [g nextPut: row]
	]