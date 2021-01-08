as yet unclassified
sortedBy: column with: aBlock
	"Returns a new DataFrame with the index sorted by the specified column using aBlock as the comparison function."
	
	| series sorted |
	
	series := self at: column.
	sorted := series sorted: aBlock.
	
	^DataFrame new initializeWithData: columnData columns: columnNames index: sorted index
