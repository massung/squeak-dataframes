as yet unclassified
dropNA
	"Returns a new DataFrame with records removed that have any missing values."

	| selected |
	
	selected := primaryIndex select: [:index |
		columnData allSatisfy: [:column | (column at: index) notNil]
	].

	^DataFrame new initializeWithData: columnData columns: columnNames index: selected
