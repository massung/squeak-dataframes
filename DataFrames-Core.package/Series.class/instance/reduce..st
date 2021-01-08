as yet unclassified
reduce: aBlock 
	"Like Collection>>reduce:, but for the indexed values of the Series."
	
	| i acc x |
	
	(i := recordIndex findFirst: [:rowIndex | (values at: rowIndex) notNil]) = 0
		ifTrue: [^nil].
	
	"initial value"
	acc := values at: (recordIndex at: i).
	
	"apply the rest of the index"
	i+1 to: recordIndex size do: [:row |
		acc := (x := values at: row)
			ifNotNil: [aBlock value: acc value: x]
			ifNil: [acc]
	].

	^acc