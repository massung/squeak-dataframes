as yet unclassified
with: other do: aBlock ifNil: nilBlock
	"Applies a two-argument block with another series or collection."

	(other isKindOf: Series orOf: Array) 
		ifFalse: [self do: [:x | aBlock value: x value: other] ifNil: nilBlock]
		ifTrue: [
			| x y |
			
			primaryIndex withIndexDo: [:rowIndex :i |
				x := values at: rowIndex.
				y := other at: i.
				
				(x notNil and: [y notNil])
					ifTrue: [aBlock value: x value: y]
					ifFalse: nilBlock
			]
		]
