as yet unclassified
dropDuplicate: column keep: keep
	"Keeps only the first, last or no duplicates rows for a given column's value. Keep should be #first, #last, or #none."
	
	| keyIndex selected |
	
	"find all the unique keys"
	keyIndex := self secondaryIndex: column.
	
	"keep only the first, last, or no duplicates"
	selected := Array new: keyIndex size streamContents: [:rows |
		keyIndex do: [:key :rowIndices |
			rowIndices size = 1
				ifTrue: [rows nextPut: rowIndices first]
				ifFalse: [
					keep = #first ifTrue: [rows nextPut: rowIndices first].
					keep = #last ifTrue: [rows nextPut: rowIndices last]
				]
		]
	].

	^DataFrame new initializeWithData: columnData columns: columnNames index: selected
	