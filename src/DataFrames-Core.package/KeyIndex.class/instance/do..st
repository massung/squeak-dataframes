as yet unclassified
do: aBlock
	"For each unique key, execute aBlock with the key and the collection of row indexes it's found on."

	^keys withIndexDo: [:key :index |
		aBlock value: key value: (indexes at: index)
	]
	