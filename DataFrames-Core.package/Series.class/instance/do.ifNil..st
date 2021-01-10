as yet unclassified
do: aBlock ifNil: nilBlock
	"Appyies a single-argument block to every element in the series."

	| x |

	primaryIndex do: [:rowIndex | 
		(x := values at: rowIndex)
			ifNil: nilBlock
			ifNotNil: [aBlock value: x]
	]
	