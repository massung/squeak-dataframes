as yet unclassified
dropNA
	"Returns a new DataFrame with records removed that have any missing values."

	| selected |
	
	selected := primaryIndex select: [:index |
		columnValues allSatisfy: [:column | (column at: index) notNil]
	].

	^self copyWithIndex: selected
