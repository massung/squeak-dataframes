as yet unclassified
streamRecords: aBlock
	"Like Collection>>streamContents:, but for records."
	
	self addRecords: (Generator on: aBlock)