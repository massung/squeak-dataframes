as yet unclassified
at: key ifAbsent: aBlock
	"Returns a stream of indexes matching a given key in the b-tree."
	
	| index |
	
	^(index := self indexOfKey: key) = 0
		ifTrue: [aBlock value]
		ifFalse: [indexes at: index]
