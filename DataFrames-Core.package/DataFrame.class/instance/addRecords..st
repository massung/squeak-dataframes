as yet unclassified
addRecords: aStream
	"Adds all records from aStream to the columnData."
	
	| columns index |
	
	"special case: handle first ever row, which identifies the number of columns"
	columns := columnData collect: [:data | WriteStream with: data].
		
	"build the record index"
	index := WriteStream with: primaryIndex.
	
	"all the remaining records"
	[aStream atEnd] whileFalse: [
		| i stream |
		
		aStream next keysAndValuesDo: [:column :x |
			i := columnNames indexOf: column ifAbsent: [
				columns := columns , {WriteStream with: (Array new: index position)}.
				
				"add another column"
				(columnNames := columnNames , {column}) size
			].
		
			"pad nil values if the column has fallen behind"
			(stream := columns at: i) position < index position ifTrue: [
				index position - stream position timesRepeat: [stream nextPut: nil]
			].
		
			"write this value"
			stream nextPut: x
		].
	
		index nextPut: index position + 1
	].

	"update the frame data"
	columnData := columns collect: [:stream |
		stream position < index position
			ifTrue: [stream contents , (Array new: index position - stream position)]
			ifFalse: [stream contents]
	].

	"update the record index"
	primaryIndex := index contents
	