as yet unclassified
initializeWithData: data columns: columns index: index
	"Data is an array of arrays, columns is an array of column names, and the index is the record index."

	columnNames := columns.
	columnData := data.
	primaryIndex := index.
	secondaryIndexes := Dictionary new.