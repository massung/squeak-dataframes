as yet unclassified
select: aBlock ifNil: nilBlock
	"Returns a new Series filtered."
	
	| x selected |
	
	selected := Array streamContents: [:i |
		recordIndex do: [:row |
			((x := values at: row)	ifNotNil: [aBlock value: x] ifNil: [nilBlock value])
				ifTrue: [i nextPut: row]
		]
	].

	^Series values: values index: selected
