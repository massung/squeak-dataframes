as yet unclassified
initializeWithColumnValues: columns
	"Builds the DataFrame with a list of column values. For example: #(#(1 2 3) #(4 5 6)) will create two columns, each with 3 values."

	self initialize.

	"each column name is the index of the values"
	columns withIndexDo: [:values :i |
		self at: i put: values
	]
