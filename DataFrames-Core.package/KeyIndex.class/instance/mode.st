as yet unclassified
mode
	"Returns the most frequently occurring key or error if empty."
	
	| max index |
	
	max := 0.
	index := nil.
	
	indexes withIndexDo: [:xs :i |
		index := xs size > max ifTrue: [max := xs size. i] ifFalse: [index]
	].

	^index
		ifNil: [self error: 'empty ColumnIndex']
		ifNotNil: [keys at: index]
