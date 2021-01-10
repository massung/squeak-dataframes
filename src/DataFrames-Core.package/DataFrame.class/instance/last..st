as yet unclassified
last: n
	"Returns a DataFrame with only the last n records."
	
	^DataFrame new
		initializeWithData: columnData
		columns: columnNames
		index: (primaryIndex last: n)
	