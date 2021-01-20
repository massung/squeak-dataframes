as yet unclassified
initializeWithHeader: header rows: rows
	"Initializes with columns first, then add all the rows."

	self initializeWithHeader: header; addRows: rows readStream
