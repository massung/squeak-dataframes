as yet unclassified
isNA
	"isNil test per value, but intended to not override #isNil."
	
	^self collect: [:x | false] ifNil: true