as yet unclassified
reduce: aBlock groupedBy: primaryColumn
	"Returns a new DataFrame aggregated by primaryColumn by evaluating aBlock with a Series per column/key pair."
	
	| keyIndex columns |
	
	keyIndex := self secondaryIndex: primaryColumn.
	
	"create the column arrays and add the primary column of keys"
	columns := Array new: columnNames size.
	columns at: 1 put: primaryColumn -> keyIndex keys.
	
	"add all the secondary columns"
	(columnNames copyWithout: primaryColumn) withIndexDo: [:column :i |
		| data |
		
		"evaluate the column for every key"
		data := keyIndex collect: [:key :rowIndexes |
			aBlock value: (Series values: (columnData at: i + 1) index: rowIndexes)
		].
		
		columns at: i + 1 put: column -> data
	].

	^DataFrame withColumns: columns
	