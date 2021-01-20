as yet unclassified
initializeWithHeader: header
	"Builds the DataFrame no rows, but the columns defined."

	self initialize.

	"create an empty column for each"
	header do: [:column |
		self at: column put: #()
	]