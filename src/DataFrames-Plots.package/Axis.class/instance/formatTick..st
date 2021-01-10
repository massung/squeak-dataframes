as yet unclassified
formatTick: tick
	"Returns the string used as the format for the tick mark."
	
	| label |
	
	label := tickFormat
		ifNotNil: [tickFormat value: tick]
		ifNil: [
			(tick isNumber and: tick isInteger not)
				ifTrue: [tick asFloat printShowingDecimalPlaces: 2]
				ifFalse: [tick]
		].
	
	^label asString
