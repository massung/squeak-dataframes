as yet unclassified
rightJoin: other on: column and: otherColumn
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
		| x leftRows |
		
		other rowsDo: [:rightRow |
			x := rightRow at: rightColumnIndex.
			
			(leftRows := (self secondaryIndex: column) at: x ifAbsent: nil)
				ifNil: [df nextPut: nilRow , rightRow]
				ifNotNil: [
					leftRows do: [:rowIndex |
						df nextPut: (self rowAt: rowIndex) , rightRow
					]
				]
		]
	]
