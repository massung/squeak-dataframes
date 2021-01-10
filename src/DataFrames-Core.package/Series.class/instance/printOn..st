as yet unclassified
printOn: aStream

	primaryIndex do: [:rowIndex |
		(values at: rowIndex) printOn: aStream.
		aStream cr
	]
