as yet unclassified
put: anObject
	"Writes a single object to the stream."
	
	anObject ifNil: [
		^dialect naRep asString putOn: stream
	].

	"booleans"
	(anObject == true or: anObject == false) ifTrue: [
		^anObject asString putOn: stream
	].
	
	"string and symbols are special collections"
	(anObject isString or: anObject isSymbol) ifTrue: [
		^self putString: anObject asString
	].

	"collections cannot be multiple levels deep"
	anObject isCollection ifTrue: [
		writingCollection ifTrue: [self error: 'cannot write multi-level deep collections!'].
		
		"write a list of associations or just an array of elements"
		^anObject isDictionary
			ifTrue: [self putMap: anObject]
			ifFalse: [self putList: anObject].
	].

	"scalar magnitude expected"
	(anObject isKindOf: Magnitude) ifFalse: [
		self error: 'do not know how to encode non-magnitude object'
	].

	"convert to string and write it (may need quotes... e.g. dates)"
	^self putString: anObject asString
	