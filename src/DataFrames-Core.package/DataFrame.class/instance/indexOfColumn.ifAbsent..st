as yet unclassified
indexOfColumn: column ifAbsent: aBlock
	"Returns the index for a column."

	| index |
	
	^(column isInteger and: [column between: 1 and: columnValues size])
		ifTrue: [column]
		ifFalse: [
			(index := columnNames indexOf: column) > 0
				ifTrue: [index]
				ifFalse: aBlock
		]
