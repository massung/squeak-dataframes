as yet unclassified
initializeWithColumnNames: columns
	"Builds the DataFrame no rows, but the columns defined."

	self initialize.

	"create an empty column for each"
	columns do: [:column |
		self at: column put: #()
	]