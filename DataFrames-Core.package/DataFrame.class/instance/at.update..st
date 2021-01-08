as yet unclassified
at: column update: aBlock
	"Helper function. Shortcut for (df at: column put: ((df at: column) collect: aBlock))."
	
	(self at: column) update: [:x | aBlock value: x]
	