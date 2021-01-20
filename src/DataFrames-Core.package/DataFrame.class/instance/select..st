as yet unclassified
select: aSeries
	"Filters records and returns a new DataFrame from aSeries or anArray."
	
	| selected |
	
	selected := Array streamContents: [:index |
		primaryIndex with: aSeries asArray do: [:row :flag | 
			flag ifTrue: [index nextPut: row]
		]
	].
	
	^self copyWithIndex: selected
