as yet unclassified
rankBy: column
	"Similar to #rank, but ranks by the value in a given column (assumes the frame is sorted by the column). Columns with the same value will have the same rank."
	
	^(self at: column) rank
