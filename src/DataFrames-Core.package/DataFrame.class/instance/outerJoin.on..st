as yet unclassified
outerJoin: other on: column
	"Creates a new DataFrame with new column data joined from this frame and another."
	
	^self outerJoin: other on: column and: column