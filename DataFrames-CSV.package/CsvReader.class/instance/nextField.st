as yet unclassified
nextField
	"Read the next field from the current line stream."

	| quoted field |
	
	field := fieldBuffer writeStream.
	last := stream next.
	
	"quoted fields are parsed differently than non-quoted"
	(quoted := last = dialect quoteCharacter)
		ifFalse: [
			[last isNil or: last = dialect fieldSeparator or: (CharacterSet crlf includes: last)] whileFalse: [
				field nextPut: last.
				last := stream next.
			]
		]
		
		ifTrue: [
			[quoted] whileTrue: [
				(last := stream next) = dialect escapeCharacter 
					ifTrue: [field nextPut: stream next]
					ifFalse: [
						last = dialect quoteCharacter
							ifFalse: [field nextPut: last]
							ifTrue: [
								last := stream next.
									
								"quote followed by eol or field separator"
								(last isNil or: last = dialect fieldSeparator or: (CharacterSet crlf includes: last))
									ifTrue: [quoted := false]
									ifFalse: [
										field nextPut: dialect quoteCharacter.
										
										"bad quote in the middle, just write it out"
										last = dialect quoteCharacter ifFalse: [
											field nextPut: last
										]
									]
							]
					]
			]
		].
	
	^field contents

