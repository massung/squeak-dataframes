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
	
	"create the key and index lists"
	keys := Array new: associations size.
	indexes := Array new: associations size.
	
	"split them into keys and indexes"
	associations withIndexDo: [:assoc :i |
		keys at: i put: assoc key.
		indexes at: i put: assoc value contents.
	]
