as yet unclassified
with: other collect: aBlock ifNil: nilBlock
	"Applies a two-argument block with another series or collection and returns a array."

	^(other isKindOf: Series orOf: Array) 
		ifFalse: [self collect: [:x | aBlock value: x value: other] ifNil: nilBlock]
		ifTrue: [
			| xs x y |
		
			xs := primaryIndex withIndexCollect: [:rowIndex :i |
				x := values at: rowIndex.
				y := other at: i.
			
				(x notNil and: [y notNil])
					ifTrue: [aBlock value: x value: y]
					ifFalse: nilBlock
			].
	
			^Series values: xs index: primaryIndex
		]
