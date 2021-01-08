as yet unclassified
innerJoin: other on: column
	"Creates a new DataFrame with new column data joined from this frame and another. Any records where the columns are not equal are dropped."
	
	^self innerJoin: other on: column and: column