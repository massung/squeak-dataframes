as yet unclassified
do: aBlock ifNil: nilBlock
	"Appyies a single-argument block to every element in the series."

	| x |

	recordIndex do: [:row | 
		(x := values at: row)
			ifNil: nilBlock
			ifNotNil: [aBlock value: x]
	]
	