as yet unclassified
indexOfColumn: column
	"Returns the index for a column."

	^self indexOfColumn: column ifAbsent: [self columnDoesNotExist]
