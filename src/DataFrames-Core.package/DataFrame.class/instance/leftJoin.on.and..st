as yet unclassified
leftJoin: other on: column and: otherColumn
	"Creates a new DataFrame with new column data joined from this frame and another."
	
	| leftColumnIndex rightColumnIndex nilRow columns |
	
	leftColumnIndex := self indexOfColumn: column.
	rightColumnIndex := other indexOfColumn: otherColumn.
	
	"when no matching row is found, merge nil values"
	nilRow := Array new: other shape x.
	
	"initialize the frame with no data, but columns"
	columns := DataFrame mergeColumns: columnNames , other columns.
	
	"perform the merge"
	^DataFrame new initializeWithColumnNames: columns; streamRows: [:df |
		| x rightRows |
		
		self rowsDo: [:leftRow |
			x := leftRow at: leftColumnIndex.
			
			(rightRows := (other secondaryIndex: otherColumn) at: x ifAbsent: nil)
				ifNil: [df nextPut: leftRow , nilRow]
				ifNotNil: [
					rightRows do: [:rowIndex |
						df nextPut: leftRow, (other rowAt: rowIndex)
					]
				]
		]
	]
