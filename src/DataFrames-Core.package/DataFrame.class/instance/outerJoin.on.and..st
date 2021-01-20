as yet unclassified
outerJoin: other on: column and: otherColumn
	"Creates a new DataFrame with new column data joined from this frame and another."
	
	| leftColumnIndex rightColumnIndex header keyColumn nilRow |
	
	leftColumnIndex := self indexOfColumn: column.
	rightColumnIndex := other indexOfColumn: otherColumn.
	
	"there is only a key column if both columns are the same"
	keyColumn := column = otherColumn ifTrue: [column] ifFalse: [nil].
	
	"initialize the frame with no data, but columns"
	header := DataFrame mergeHeader: columnNames , other columns key: keyColumn.
	nilRow := Array new: header size - self shape x.
	
	"perform the merge"
	^DataFrame new initializeWithHeader: header;  streamRows: [:df |
		| key rightRows rightRow |
		
		self rowsDo: [:leftRow |
			key := leftRow at: leftColumnIndex.
			
			"for every right-row, copy to row and write to frame"
			(rightRows := (other secondaryIndex: otherColumn) at: key ifAbsent: [nil])
				ifNil: [df nextPut: leftRow , nilRow]
				ifNotNil: [
					rightRows do: [:rowIndex |
						rightRow := other rowAt: rowIndex.
				
						"if keyed with the same column, drop the right column"
						keyColumn ifNotNil: [
							rightRow := rightRow copyWithoutIndex: rightColumnIndex
						].
			
						df nextPut: leftRow , rightRow
					]
			]
		]
	]

