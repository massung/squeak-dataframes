as yet unclassified
putChar: aChar

	aChar = dialect quoteCharacter ifTrue: [
		dialect doubleQuote
			ifTrue: [stream nextPut: dialect quoteCharacter]
			ifFalse: [stream nextPut: dialect escapeCharacter]
	].
		
	stream nextPut: aChar