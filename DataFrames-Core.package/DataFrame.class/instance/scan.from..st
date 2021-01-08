as yet unclassified
scan: column from: startValue
	"Search the frame for all rows with (column >= startValue). For each index, execute aBlock."
	
	^(self secondaryIndex: column) from: startValue
