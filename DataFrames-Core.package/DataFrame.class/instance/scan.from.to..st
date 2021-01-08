as yet unclassified
scan: column from: startValue to: endValue
	"Search the frame for all rows with (column between: startValue and: endValue). For each index, execute aBlock."
	
	^(self secondaryIndex: column) from: startValue to: endValue