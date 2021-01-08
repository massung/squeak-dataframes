as yet unclassified
mean
	"Returns the mean value of the series."
	
	^self isEmpty
		ifTrue: [nil]
		ifFalse: [(self reduce: [:a :b | a + b]) / self size]
	