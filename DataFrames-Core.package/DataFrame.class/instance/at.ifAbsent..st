as yet unclassified
at: column ifAbsent: aBlock
	"Returns the Series associated with a column name or index."

	| data index |
	
	index := self indexOfColumn: column ifAbsent: [^aBlock value].
	data := columnData at: index ifAbsent: [^aBlock value].
	
	^Series values: data index: primaryIndex
