as yet unclassified
putMap: aDict
	"Writes an array of associations to the stream, quoted and using a different separator."
	
	| first |
	
	first := true.
	stream nextPut: dialect quoteCharacter.
	
	aDict keysAndValuesDo: [:k :v |
		first
			ifTrue: [first := false]
			ifFalse: [stream nextPut: dialect collectionSeparator].
		
		self put: k.
		stream nextPut: dialect associationSeparator.
		self put: v
	].
	
	"close dict"
	stream nextPut: dialect quoteCharacter.