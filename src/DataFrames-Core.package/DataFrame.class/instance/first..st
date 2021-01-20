as yet unclassified
first: n
	"Returns a DataFrame with only the first n records."
	
	^self copyWithIndex: (primaryIndex first: n)
	