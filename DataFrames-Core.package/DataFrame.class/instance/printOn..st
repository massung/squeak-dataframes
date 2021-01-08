as yet unclassified
printOn: aStream
	"Default print format is a basic CSV. Begins the header with a comment character to ensure it's differentiated when debugging."
	
	aStream nextPut: (CsvDialect default commentCharacter).
	
	^self printAsCsvOn: aStream
	