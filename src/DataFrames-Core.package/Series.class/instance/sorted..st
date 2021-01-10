as yet unclassified
sorted: aBlock
	"Returns a new Series, but with sorted using aBlock as the comparison between two values."
	
	| sortedIndex x y |
	
	sortedIndex := primaryIndex sorted: [:a :b |
		x := values at: a.
		y := values at: b.
		
		"sort nil values at the end"
		x notNil and: [y isNil or: [aBlock value: x value: y]]
	].
	
	^Series values: values index: sortedIndex
	