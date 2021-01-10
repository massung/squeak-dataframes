as yet unclassified
writeAsCsv: aCsvDialect toFileNamed: aString

	StandardFileStream newFileNamed: aString do: [:stream |
		self printAsCsv: aCsvDialect on: stream
	]
