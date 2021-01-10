as yet unclassified
leftJoin: other on: column
	"Creates a new DataFrame with new column data joined from this frame and another."
	
	^self leftJoin: other on: column and: column