as yet unclassified
last: n
	"Returns a DataFrame with only the last n records."
	
	^self copyWithIndex: (primaryIndex last: n)
	