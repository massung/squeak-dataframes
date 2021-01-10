as yet unclassified
readHeader
	"Reads the next line from the file and parses it as the header record. All lines beginning with the comment character are skipped."
	
	(header := self nextRow) ifNil: [self error: 'no header row found']
