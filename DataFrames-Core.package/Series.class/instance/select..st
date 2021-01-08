as yet unclassified
select: aBlock
	"Returns a new Series filtered."
	
	^self select: aBlock ifNil: false
	