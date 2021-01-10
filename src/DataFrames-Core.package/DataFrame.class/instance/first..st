as yet unclassified
first: n
	"Returns a DataFrame with only the first n records."
	
	^DataFrame new
		initializeWithData: columnData
		columns: columnNames
		index: (primaryIndex first: n)
	