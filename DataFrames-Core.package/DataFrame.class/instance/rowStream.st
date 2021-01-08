as yet unclassified
rowStream
	"Returns a Generator stream that produces each record as an array."

	^Generator on: [:stream |
		self rowsDo: [:row | stream nextPut: row]
	]
