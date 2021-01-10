as yet unclassified
from: key
	"Returns a stream of indexes where (indexKey >= key)."

	| search index |
	
	search := [:k |
		k = key ifTrue: [0] ifFalse: [key < k ifTrue: -1 ifFalse: 1]
	].
	
	^Generator on: [:g |
		index := keys findBinaryIndex: search ifNone: [:a :b | b].
		
		[index <= indexes size] whileTrue: [
			(indexes at: index) do: [:x | g nextPut: x].
			
			"next association"
			index := index + 1
		]
	]