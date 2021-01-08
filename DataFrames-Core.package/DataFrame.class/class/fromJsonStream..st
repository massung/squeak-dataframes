as yet unclassified
fromJsonStream: stream
	"Read a JSON stream into a new DataFrame."
	
	^DataFrame new initializeWithRecords: (STON fromStream: stream)
