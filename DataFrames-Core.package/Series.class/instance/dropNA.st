as yet unclassified
dropNA
	"Returns a new Series with all nil values removed."
	
	^Series values: values index: (recordIndex select: [:rowIndex | (values at: rowIndex) notNil])
	