as yet unclassified
scan: column to: endValue
	"Search the frame for all rows with (column <= endValue). For each index, execute aBlock."
	
	^(self secondaryIndex: column) to: endValue