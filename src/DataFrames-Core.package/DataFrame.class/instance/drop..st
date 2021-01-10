as yet unclassified
drop: column
	"Returns a new frame with all columns but this one."

	^self cut: (columnNames copyWithoutIndex: (self indexOfColumn: column))
