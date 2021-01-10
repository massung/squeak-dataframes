as yet unclassified
initializeWithRows: rows columns: columns
	"Initializes with columns first, then add all the rows."

	self initializeWithColumnNames: columns; addRows: rows readStream
