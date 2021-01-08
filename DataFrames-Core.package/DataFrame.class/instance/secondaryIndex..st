as yet unclassified
secondaryIndex: column
	"Return a KeyIndex for a column."
	
	^secondaryIndexes at: column ifAbsentPut: [
		KeyIndex keys: (self at: column) asArray
	]
