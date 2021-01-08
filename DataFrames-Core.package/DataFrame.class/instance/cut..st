as yet unclassified
cut: columns
	"Returns a new DataFrame with a subset of the columns."
	
	| associations |
	
	associations := columns collect: [:column |
		column -> (self at: column)
	].
	
	^DataFrame withColumns: associations
