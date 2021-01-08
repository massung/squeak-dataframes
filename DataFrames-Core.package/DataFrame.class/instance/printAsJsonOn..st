as yet unclassified
printAsJsonOn: aStream
	"Outputs as a Json array to a stream."
	
	| first |
	
	first := true.
	aStream nextPut: $[.
	
	self recordsDo: [:record |
		first 
			ifFalse: [aStream nextPut: $,]
			ifTrue: [first := false].
		
		"write the next JSON record"
		STON put: record asJsonOnStream: aStream
	].

	aStream nextPut: $].
	aStream flush.