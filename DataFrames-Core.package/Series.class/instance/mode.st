as yet unclassified
mode
	"Returns the most commonly occurring, non-nil value."
	
	| bag assoc |
	
	bag := Bag new.
	
	self do: [:x | bag add: x].
	
	"most common association"
	assoc := bag valuesAndCounts associations reduce: [:a :b |
		a value > b value ifTrue: [a] ifFalse: [b]
	].

	^assoc ifNil: [nil] ifNotNil: [assoc key]
