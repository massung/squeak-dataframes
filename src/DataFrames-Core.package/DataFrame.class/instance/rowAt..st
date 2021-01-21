as yet unclassified
rowAt: index
	"Returns an array of column values at the given index."

	^columnValues collect: [:data | data at: (primaryIndex at: index)]
