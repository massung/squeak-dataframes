private
initializeWithHeader: header values: values index: index
	"Data is an array of arrays, header is an array of column names, data is an array of arrays (each element being an array of column values), and the index is the primary index."

	columnNames := header copy.
	columnValues := values.
	primaryIndex := index.
	secondaryIndexes := Dictionary new.
	