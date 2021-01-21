as yet unclassified
addRows: aStream
	"Adds all rows from aStream to the columnData."
	
	| row columns index |
	
	"special case: handle first ever row, which identifies the number of columns"
	columns := columnValues isEmpty
		ifFalse: [columnValues collect: [:data | data writeStream]]
		ifTrue: [aStream next collect: [:x | (Array with: x) writeStream]].
	
	"update the record index"
	index := WriteStream with: primaryIndex.
	
	"all the remaining rows"
	[aStream atEnd] whileFalse: [
		(row := aStream next) with: columns do: [:x :column |
			column nextPut: x
		].
	
		index nextPut: index position + 1
	].

	"update the frame data and record index"
	columnValues := columns collect: [:stream | stream contents].
	primaryIndex := index contents
	