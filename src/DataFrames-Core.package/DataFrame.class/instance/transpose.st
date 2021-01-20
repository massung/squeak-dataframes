as yet unclassified
transpose
	"Returns a new DataFrame transposing rows and columns where the first column is the header."
	
	| columns |
	
	columns := Array new: self size + 1 streamContents: [:c |
		c nextPut: columnNames.
		
		"each row becomes a new column of values."
		self rowsDo: [:row | c nextPut: row]
	].

	^DataFrame new initializeWithColumns: columns