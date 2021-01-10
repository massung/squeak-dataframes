as yet unclassified
fractionOf: value
	"Returns the fraction along the axis the value is."
	
	^(min isNil or: max isNil)
		ifTrue: [0]
		ifFalse: [
			value isNumber
				ifTrue: [(value - self min) / (self max - self min)]
				ifFalse: [self fractionOf: (index indexOf: value)]
		]
