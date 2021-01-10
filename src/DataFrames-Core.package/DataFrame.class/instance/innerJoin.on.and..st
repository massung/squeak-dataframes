as yet unclassified
innerJoin: other on: column and: otherColumn
	"Creates a new DataFrame with new column data joined from this frame and another."
	
	| leftColumnIndex rightColumnIndex columns |
	
	leftColumnIndex := self indexOfColumn: column.
	rightColumnIndex := other indexOfColumn: otherColumn.
	
	"initialize the frame with no data, but columns"
	columns := DataFrame mergeColumns: columnNames , other columns.
	
	"perform the merge"
	^DataFrame new initializeWithColumnNames: columns;  streamRows: [:df |
		| x |
		
		self rowsDo: [:leftRow |
			x := leftRow at: leftColumnIndex.
			
			"find all right-frame values equal"
			(other scan: otherColumn for: x) do: [:rowIndex |
				df nextPut: leftRow , (other rowAt: rowIndex)
			]
		]
	]

