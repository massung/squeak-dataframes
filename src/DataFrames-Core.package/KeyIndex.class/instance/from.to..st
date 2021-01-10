as yet unclassified
from: startKey to: endKey
	"Returns a stream of indexes where (indexKey between: startKey and: endKey)."

	| search index |
	
	search := [:k |
		k = startKey ifTrue: [0] ifFalse: [startKey < k ifTrue: -1 ifFalse: 1]
	].
	
	^Generator on: [:g |
		index := keys findBinaryIndex: search ifNone: [:a :b | b].
		
		[index <= indexes size and: [(keys at: index) <= endKey]] whileTrue: [
			(indexes at: index) do: [:x | g nextPut: x].
			
			"next association"
			index := index + 1
		]
	]
	