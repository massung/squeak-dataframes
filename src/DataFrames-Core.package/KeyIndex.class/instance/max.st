as yet unclassified
max
	"Returns the largest key or error if empty."
	
	^keys
		ifEmpty: [self error: 'empty ColumnIndex']
		ifNotEmpty: [keys last]
	