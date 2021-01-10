as yet unclassified
keys: anArray
	"Given an array of keys, build a sorted list of value -> index list associations."
	
	| map associations |
	
	map := Dictionary new.
	
	"build the map of value -> index list"
	anArray withIndexDo: [:value :i |
		value ifNotNil: [
			(value respondsTo: #<=) ifFalse: [
				self error: 'Cannot index values that do not respondsTo: #<='
			].
	
			(map at: value ifAbsentPut: (Array new: 20) writeStream) nextPut: i
		]
	].

	"sort the key/value associations"
	associations := map associations sort: [:a :b | a key < b key].
	
	"split them into keys and indexes"
	keys := associations collect: [:assoc | assoc key].
	indexes := associations collect: [:assoc | assoc value contents]
	