as yet unclassified
do: aBlock
	"Appyies a single-argument block to every element in the series."

	^self do: aBlock ifNil: []
	