as yet unclassified
with: other do: aBlock
	"Appyies a two-argument block to every element in the series ."

	^self with: other do: aBlock ifNil: []
	