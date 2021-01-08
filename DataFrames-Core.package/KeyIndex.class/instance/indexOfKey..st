as yet unclassified
indexOfKey: key
	"Returns a the index into the BTree keys list for a key or 0 if not found. Since sorted, use binary search."
	
	| search |
	
	search := [:k |
		k = key ifTrue: [0] ifFalse: [key < k ifTrue: -1 ifFalse: 1]
	].

	^keys findBinaryIndex: search ifNone: [:a :b | 0]
