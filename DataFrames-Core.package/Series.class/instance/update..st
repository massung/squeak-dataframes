as yet unclassified
update: aBlock
	"Instead of collecting a new Series, modifies the values in-place."

	recordIndex do: [:rowIndex |
		values at: rowIndex put: (aBlock value: (values at: rowIndex)).
	]
	