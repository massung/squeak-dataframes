as yet unclassified
mergeHeader: header key: key
	"Helper function. Given a list of column names, rename the columns to differentiate duplicates."
	
	| merged y |
	
	merged := header copy.
	
	"collect all the columns, duplicates end up with 2 indexes"
	header withIndexDo: [:column :x |
		(y := header indexOf: column startingAt: x+1) > 0 ifTrue: [
			column = key
				ifTrue: [merged at: y put: nil]
				ifFalse: [
					merged
						at: x put: column , '_x';
						at: y put: column , '_y'
				]
		]
	].

	^merged copyWithout: nil
	