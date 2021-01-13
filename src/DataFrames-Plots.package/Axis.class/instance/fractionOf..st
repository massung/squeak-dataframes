as yet unclassified
fractionOf: value
	"Returns the fraction [0,1] along the axis the value is located. If the value is non-interpolating (does not understand #inverseLerpFrom:to:), then it is assumed to be an enumerated value. Enumerated values are located in the tick keys and the tick value is then used to interpolate."
	
	^(min isNil or: max isNil)
		ifTrue: [0]
		ifFalse: [
			(value respondsTo: #inverseLerpFrom:to:)
				ifTrue: [value inverseLerpFrom: self min to: self max]
				ifFalse: [
					| index |
					
					(index := ticks findFirst: [:assoc | assoc key = value]) = 0
						ifTrue: [^0]
						ifFalse: [^index inverseLerpFrom: self min to: self max]
				]
		]
