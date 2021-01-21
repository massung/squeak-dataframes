as yet unclassified
copyWithIndex: index
	"Returns a new DataFrame using the same headers and column data (shallow copy), but with a different primary index."
	
	^DataFrame new initializeWithHeader: columnNames values: columnValues index: index