as yet unclassified
rowsDo: aBlock
	"Call aBlock for each row in the frame. Each row is an array."
	
	1 to: self size do: [:i | aBlock value: (self rowAt: i)]
	