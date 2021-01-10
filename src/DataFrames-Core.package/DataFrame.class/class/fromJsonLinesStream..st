as yet unclassified
fromJsonLinesStream: stream
	"Read a stream as JSON lines into a new DataFrame."
	
	| records |
	
	records := Generator on: [:g |
		[stream atEnd] whileFalse: [
			g nextPut: (STON fromString: (stream nextLine))
		]
	].

	^DataFrame new addRecords: records