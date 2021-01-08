as yet unclassified
notNA
	"notNil test per value, but intended to not override #notNil."
	
	^self collect: [:x | true] ifNil: false