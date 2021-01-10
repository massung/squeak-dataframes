as yet unclassified
dropNA
	"Returns a new Series with all nil values removed."
	
	^Series values: values index: (primaryIndex select: [:rowIndex | (values at: rowIndex) notNil])
	