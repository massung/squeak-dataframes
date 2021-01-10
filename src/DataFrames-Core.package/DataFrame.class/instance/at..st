as yet unclassified
at: column
	"Returns a Series associated with a column."

	^self at: column ifAbsent: [self columnDoesNotExist]
