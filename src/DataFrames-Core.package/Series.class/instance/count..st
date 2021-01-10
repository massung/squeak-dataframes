as yet unclassified
count: aBlock
	"Returns the number of values for which aBlock predicate returns true."
	
	^primaryIndex count: [:rowIndex | aBlock value: (values at: rowIndex)]
