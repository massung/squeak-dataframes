as yet unclassified
rank
	"Similar to DataFrame>>rank, but ranks by the values in the Series. This assumes the Series is sorted. Sequential values that are equal will have the same rank."
	
	| last x n ranks |
	
	last := nil.
	n := 0.
	
	"records with the same value have the same rank"
	ranks := primaryIndex collect: [:rowIndex |
		(x := values at: rowIndex) = last
			ifTrue: [n]
			ifFalse: [
				last := x.
				n := n + 1
			].
	].
	
	^Series values: ranks index: primaryIndex
	