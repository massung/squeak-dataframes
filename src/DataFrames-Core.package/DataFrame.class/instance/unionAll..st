as yet unclassified
unionAll: others
	"Return a new DataFrame that's the union of this and a list of other frames."
	
	| columns |
	
	columns := columnNames asSet.
	
	"add all the other column names"
	others do: [:df | columns := columns union: df columns].
	
	"create a new frame, copying data from this and the other frame"
	^(DataFrame new initializeWithColumnNames: columns sorted) streamRecords: [:stream |
		self recordsDo: [:record | stream nextPut: record].
		
		others do: [:df |
			df recordsDo: [:record | stream nextPut: record]
		]
	]
