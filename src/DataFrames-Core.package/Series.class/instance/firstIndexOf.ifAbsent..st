as yet unclassified
firstIndexOf: value ifAbsent: aBlock
	"Returns the first index in the series where value is first seen or zero."
	
	^primaryIndex firstIndexOf: value ifAbsent: aBlock
	