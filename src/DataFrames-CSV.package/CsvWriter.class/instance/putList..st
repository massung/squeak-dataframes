as yet unclassified
putList: anArray
	"Writes an array of elements to the stream, quoted and using a different separator."
	
	stream nextPut: dialect quoteCharacter.
	
	anArray withIndexDo: [:el :i |
		self put: el.
		
		i < anArray size ifTrue: [
			stream nextPut: dialect collectionSeparator
		]
	].
	
	"close array"
	stream nextPut: dialect quoteCharacter.