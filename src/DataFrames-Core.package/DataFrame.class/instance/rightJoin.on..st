as yet unclassified
rightJoin: other on: column
	"Creates a new DataFrame with new column data joined from this frame and another."
	
	^self rightJoin: other on: column and: column