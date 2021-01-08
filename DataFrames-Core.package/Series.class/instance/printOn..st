as yet unclassified
printOn: aStream

	recordIndex do: [:rowIndex |
		(values at: rowIndex) printOn: aStream.
		aStream cr
	]
