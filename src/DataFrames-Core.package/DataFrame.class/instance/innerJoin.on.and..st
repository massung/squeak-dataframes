as yet unclassified
innerJoin: other on: column and: otherColumn
	"Creates a new DataFrame with new column data joined from this frame and another."
	
	| leftColumnIndex rightColumnIndex header keyColumn |
	
	leftColumnIndex := self indexOfColumn: column.
	rightColumnIndex := other indexOfColumn: otherColumn.
	
	"there is only a key column if both columns are the same"
	keyColumn := column = otherColumn ifTrue: [column] ifFalse: [nil].
	
	"initialize the frame with no data, but columns"
	header := DataFrame mergeHeader: columnNames , other columns key: keyColumn.
	
	"perform the merge"
	^DataFrame new initializeWithHeader: header;  streamRows: [:df |
		| key rightRow |
		
		self rowsDo: [:leftRow |
			key := leftRow at: leftColumnIndex.
			
			"for every right-row, copy to row and write to frame"
			(other scan: otherColumn for: key) do: [:rowIndex |
				rightRow := other rowAt: rowIndex.
				
				"if keyed with the same column, drop the right column"
				keyColumn ifNotNil: [
					rightRow := rightRow copyWithoutIndex: rightColumnIndex
				].
			
				df nextPut: leftRow , rightRow
			]
		]
	]

