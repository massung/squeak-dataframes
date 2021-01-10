as yet unclassified
indexes
	"Returns a stream of all record indexes in order by key."
	
	^Generator on: [:g |
		keys withIndexDo: [:key :i |
			(indexes at: i) do: [:index | g nextPut: key -> i]
		]
	]
