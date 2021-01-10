as yet unclassified
printAsJsonLinesOn: aStream
	"Outputs as a Json array to a stream."
	
	self recordsDo: [:record |
		STON put: record asJsonOnStream: aStream.
		aStream cr
	].

	aStream flush
