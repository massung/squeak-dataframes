private
initializeWithHeader: header data: data index: index
	"Data is an array of arrays, header is an array of column names, data is an array of arrays (each element being an array of column values), and the index is the primary index."

	columnNames := header copy.
	columnData := data.
	primaryIndex := index.
	secondaryIndexes := Dictionary new.
	