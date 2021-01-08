as yet unclassified
printAsCsv: aCsvDialect on: aStream
	"Outputs as a CSV to a stream."
	
	| writer |
	
	(writer := CsvWriter dialect: aCsvDialect on: aStream)
		printRecord: columnNames.
	
	"write all the records"
	self rowsDo: [:row |
		writer printRecord: row
	].

	aStream flush
	