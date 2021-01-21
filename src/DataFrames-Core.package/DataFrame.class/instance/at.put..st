as yet unclassified
at: column put: seriesOrArray
	"Replaces or adds a column to the frame with a series or array."

	| data index |
	
	data := seriesOrArray asArray.
	
	"if there are currently no columns, create the index"
	self isEmpty ifTrue: [
		primaryIndex := Array new: data size.
		
		1 to: data size do: [:i |
			primaryIndex at: i put: i
		]
	].

	"the data length must match"
	data size = self size ifFalse: [
		self error: 'data size does''t match index size'
	].
	
	"new columns to the end"
	index := self indexOfColumn: column ifAbsent: [
		columnValues := columnValues , (Array with: #()).
		
		"append the column name"
		columnNames := columnNames , (Array with: column).
		columnNames size.
	].

	"write the data"
	columnValues at: index put: data
	