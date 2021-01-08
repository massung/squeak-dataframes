as yet unclassified
mergeColumns: columns
	"Helper function. Given a list of column names, rename the columns to differentiate duplicates."
	
	| merged dup column |
	
	"copy, optionally removing the right column matching left"
	merged := columns copy.
	
	"differentiate column names"
	1 to: merged size - 1 do: [:i |
		column := merged at: i.
		
		"is there a duplicate column after this one?"
		(dup := merged indexOf: column startingAt: i+1) > 0 ifTrue: [
			merged
				at: i put: column asString , '_x';
				at: dup put: column asString , '_y'
		]
	].

	^merged
	