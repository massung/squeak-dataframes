as yet unclassified
fromCsv: aCsvDialect fileNamed: aString
	"Read a CSV file into a new DataFrame."
	
	| stream |

	^(stream := StandardFileStream readOnlyFileNamed: aString)
		ifNil: [nil]
		ifNotNil: [
			[self fromCsv: aCsvDialect stream: stream] ensure: [
				stream close
			]
		]
	