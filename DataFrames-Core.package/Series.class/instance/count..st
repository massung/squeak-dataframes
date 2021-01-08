as yet unclassified
count: aBlock
	"Returns the number of values for which aBlock predicate returns true."
	
	^recordIndex count: [:rowIndex | aBlock value: (values at: rowIndex)]
