as yet unclassified
collect: aBlock
	"Appyies a single-argument block to every element in the series and returns an array."

	^self collect: aBlock ifNil: nil
