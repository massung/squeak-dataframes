as yet unclassified
fromJsonFileName: aString
	"Read a JSON file into a new DataFrame."

	| stream |

	^(stream := FileStream fileNamed: aString)
		ifNil: [nil]
		ifNotNil: [
			[self fromJsonStream: stream] ensure: [
				stream close
			]
		]
