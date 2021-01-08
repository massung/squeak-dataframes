as yet unclassified
cast: column as: aClass
	"Updates a column casting values to a different type. Assumes each value respondsTo: #asClass."
	
	| selector |
	
	selector := ('as' , aClass name) asSymbol.
	
	self at: column update: [:x | 
		(x respondsTo: selector)
 			ifTrue: [x perform: selector]
			ifFalse: [nil]
	]
