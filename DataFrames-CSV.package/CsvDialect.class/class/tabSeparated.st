as yet unclassified
tabSeparated

	TSV ifNil: [
		TSV := CsvDialect new fieldSeparator: Character tab
	].

	^TSV
