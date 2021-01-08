as yet unclassified
initializeWithRecords: records
	"Records is a collection of Dictionaries."

	self initialize; addRecords: records readStream
