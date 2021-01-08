as yet unclassified
nextLine
	"Skips past all newlines and lines that begin with the dialect comment character."

	stream atEnd ifFalse: [
		[CharacterSet crlf includes: (last := stream peek)] whileTrue: [stream next].

		"skip any line beginning with comment character"
		(last = dialect commentCharacter) ifTrue: [
			stream do: [:c |
				(CharacterSet crlf includes: (last := c)) ifTrue: [
					^self skipEmptyLinesAndComments
				]
			]
		]
	]
