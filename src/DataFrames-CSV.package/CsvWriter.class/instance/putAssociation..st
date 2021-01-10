as yet unclassified
putAssociation: assoc
	"Writes an association to the stream."
	
	self put: assoc key.
	
	stream nextPut: dialect associationSeparator.
	
	self put: assoc value.
