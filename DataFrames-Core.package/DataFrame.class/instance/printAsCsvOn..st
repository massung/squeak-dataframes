as yet unclassified
printAsCsvOn: aStream
	"Outputs as a CSV to a stream."
	
	^self printAsCsv: CsvDialect default on: aStream