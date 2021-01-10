as yet unclassified
fromJsonLinesFileNamed: aString
	"Read a file as JSON lines into a new DataFrame."
	
	| stream |

	^(stream := FileStream fileNamed: aString)
		ifNil: [nil]
		ifNotNil: [
			[self fromJsonLinesStream: stream] ensure: [
				stream close
			]
		]
