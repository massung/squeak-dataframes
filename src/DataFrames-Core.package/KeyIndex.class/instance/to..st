as yet unclassified
to: key
	"Returns a stream of indexes where (indexKey <= key)."

	| index |
	
	^Generator on: [:g |
		index := 1.
		
		[index <= keys size and: [(keys at: index) <= key]] whileTrue: [
			(indexes at: index) do: [:x | g nextPut: x].
			
			"next association"
			index := index + 1
		]
	]
