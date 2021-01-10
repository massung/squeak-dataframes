as yet unclassified
rename: column to: name
	"Renames one of the columns."

	| key |

	(columnNames indexOf: name) > 0
		ifTrue: [self error: 'column already exists']
		ifFalse: [
			columnNames at: (self indexOfColumn: column) put: name.
			
			"remove the old key and add a new one with the old value"
			(key := secondaryIndexes removeKey: column ifAbsent: nil) ifNotNil: [
				secondaryIndexes at: name put: secondaryIndexes
			]
		]
