as yet unclassified
streamRows: aBlock
	"Like Collection>>streamContents:, but for rows."
	
	self addRows: (Generator on: aBlock)