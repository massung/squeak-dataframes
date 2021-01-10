as yet unclassified
nextRow
	"Reads and returns the next in the stream as a string."

	| row field |

	self nextLine.

	"check for end of file"	
	stream atEnd ifTrue: [^nil].
	
	"parse every in the row"
	last := dialect fieldSeparator.
	row := rowBuffer writeStream.
	
	"as long as the last character read was a field separator, keep reading fields"
	[last = dialect fieldSeparator] whileTrue: [
		(dialect naValues includes: (field := self nextField))
			ifTrue: [row nextPut: nil]
			ifFalse: [row nextPut: field]
	].
	
	^row contents
	