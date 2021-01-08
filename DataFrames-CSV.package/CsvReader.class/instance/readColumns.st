as yet unclassified
readColumns
	"Reads each row into a list of columns. This returns a list of (header -> values) associations, or just an array of column values if there is no header. This can be faster to use than using nextRow or rowStream, which creates a new array for each row."
	
	| columns row field i |
	
	"if no header, use the first row as the number of indices."
	columns := header
		ifNotNil: [header collect: [:key | (Array new: 200) writeStream]]
		ifNil: [
			(row := self nextRow)
				ifNil: [^#()]
				ifNotNil: [
					row collect: [:x |
						(Array with: 200) writeStream
							nextPut: x;
							yourself
					]
				]
		].

	"read all the rows"
	[self nextLine. stream atEnd] whileFalse: [
		last := dialect fieldSeparator.
		i := 0.
	
		"as long as the last character read was a field separator, keep reading fields"
		[last = dialect fieldSeparator] whileTrue: [	
			field := self nextField.
			i := i + 1.
			
			(dialect naValues includes: field)
				ifTrue: [(columns at: i) nextPut: nil]
				ifFalse: [(columns at: i) nextPut: field]
		]
	].

	"collect all the columns together with headers"
	^header
		ifNil: [columns collect: [:stream | stream contents]]
		ifNotNil: [header with: columns collect: [:key :stream | key -> stream contents]]
