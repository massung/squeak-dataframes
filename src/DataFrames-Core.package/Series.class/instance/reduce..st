as yet unclassified
reduce: aBlock 
	"Like Collection>>reduce:, but for the indexed values of the Series."
	
	| i acc x |
	
	(i := primaryIndex findFirst: [:rowIndex | (values at: rowIndex) notNil]) = 0
		ifTrue: [^nil].
	
	"initial value"
	acc := values at: (primaryIndex at: i).
	
	"apply the rest of the index"
	i+1 to: primaryIndex size do: [:row |
		acc := (x := values at: row)
			ifNotNil: [aBlock value: acc value: x]
			ifNil: [acc]
	].

	^acc