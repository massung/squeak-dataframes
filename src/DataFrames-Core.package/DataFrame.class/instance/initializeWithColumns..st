as yet unclassified
initializeWithColumns: columns
	"Builds the DataFrame with collection of (column -> values) associations."

	| associations |

	self initialize.
	
	"sort dictionary associations by column name"
	associations := columns isDictionary
		ifTrue: [columns associations sorted: [:a :b | a key < b key]]
		ifFalse: [columns].
	
	"allow for just a list of keys and no data"
	associations withIndexDo: [:column :i |
		(column isKindOf: Association)
			ifTrue: [self at: column key put: column value]
			ifFalse: [self at: i put: column]
	]	
