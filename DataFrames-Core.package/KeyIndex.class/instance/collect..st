as yet unclassified
collect: aBlock
	"For each unique key, collect the results of aBlock with the key and the collection of row indexes it's found on."

	^keys withIndexCollect: [:key :index |
		aBlock value: key value: (indexes at: index)
	]
	