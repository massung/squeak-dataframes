as yet unclassified
with: other collect: aBlock
	"Appyies a two-argument block to every element in the series and returns an array."

	^self with: other collect: aBlock ifNil: nil
	