as yet unclassified
firstIndexOf: value
	"Returns the index in the series where value is first seen or zero."
	
	^self firstIndexOf: value ifAbsent: [0]