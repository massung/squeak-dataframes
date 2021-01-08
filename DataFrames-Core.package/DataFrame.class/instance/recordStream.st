as yet unclassified
recordStream
	"Returns a Generator stream that produces each record as a dictionary."

	^Generator on: [:stream |
		self recordsDo: [:record | stream nextPut: record]
	]
