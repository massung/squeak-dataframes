as yet unclassified
median
	"Returns the median key or error if empty."
	
	^keys
		ifEmpty: [self error: 'empty ColumnIndex']
		ifNotEmpty: [keys at: (keys size // 2 + 1)]