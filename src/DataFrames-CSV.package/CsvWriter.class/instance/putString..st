as yet unclassified
putString: aString
	"Writes a string to the stream."
	
	| quoted |
	
	"don't quote strings that are embedded in an already-quoted collection"
	(quoted := writingCollection not and: [aString includes: dialect fieldSeparator]) ifTrue: [
		stream nextPut: dialect quoteCharacter
	].

	"may need to quote each character"
	aString do: [:c | self putChar: c].
	
	"end quote"
	quoted ifTrue: [
		stream nextPut: dialect quoteCharacter
	]