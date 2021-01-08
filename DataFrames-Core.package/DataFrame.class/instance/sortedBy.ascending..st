as yet unclassified
sortedBy: column ascending: aBoolean
	"Returns a new DataFrame with the index sorted by the specified column."
	
	^self sortedBy: column with: (aBoolean ifTrue: [[:a :b | a < b]] ifFalse: [[:a :b | a > b]])
