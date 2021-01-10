as yet unclassified
min
	"Returns the smallest key or error if empty."
	
	^keys
		ifEmpty: [self error: 'empty ColumnIndex']
		ifNotEmpty: [keys first]
	