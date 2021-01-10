as yet unclassified
sortedBy: column
	"Returns a new DataFrame with the index sorted by the specified column."
	
	^self sortedBy: column with: [:a :b | a < b]
