as yet unclassified
recordsDo: aBlock
	"Call aBlock for each record in the frame as a dictionary."
	
	1 to: self size do: [:i | aBlock value: (self recordAt: i)]
