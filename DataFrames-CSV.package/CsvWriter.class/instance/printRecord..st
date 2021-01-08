as yet unclassified
printRecord: anArray
	"Writes a record to the stream."
	
	anArray withIndexDo: [:object :i |
		self put: object.
		
		i < anArray size ifTrue: [
			stream nextPut: dialect fieldSeparator
		]
	].

	"terminate record"
	stream nextPut: dialect lineSeparator
	