as yet unclassified
recordAt: index
	"Returns a dictionary of column values at the given index."

	| rowIndex record |
	
	rowIndex := primaryIndex at: index.
	record := Dictionary new.
	
	columnNames withIndexDo: [:column :i |
		record at: column put: ((columnValues at: i) at: rowIndex)
	].

	^record
