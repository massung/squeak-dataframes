as yet unclassified
initializeWithDialect: aCsvDialect on: aStream

	dialect := aCsvDialect.
	stream := aStream.
	fieldDelimiters := CharacterSet crlf union: (ByteCharacterSet with: dialect fieldSeparator).
	fieldBuffer := String new: 200.
	rowBuffer := Array new: 100.
	