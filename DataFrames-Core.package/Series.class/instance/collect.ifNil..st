as yet unclassified
collect: aBlock ifNil: nilBlock
	"Appyies a single-argument block to every element in the series and returns a new Series."

	| xs x |
	
	xs := recordIndex collect: [:rowIndex | 
		(x := values at: rowIndex)
			ifNotNil: [aBlock value: x]
			ifNil: [nilBlock value]
	].

	^Series values: xs index: recordIndex
