as yet unclassified
scan: column for: value
	"Search the frame for all rows with (column = value). For each index, execute aBlock."
	
	^(self secondaryIndex: column) at: value
	