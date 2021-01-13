as yet unclassified
fromCsv: aCsvDialect stream: stream
	"Read a CSV file into a new DataFrame."
	
	| reader |
	
	(reader := CsvReader new initializeWithDialect: aCsvDialect on: stream)
		readHeader.
	
	"read all the columns"
	^DataFrame columns: reader readColumns