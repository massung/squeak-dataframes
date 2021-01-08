as yet unclassified
column: columnName
	"Sets the column name this axis draws from."
	
	series := figure dataFrame at: columnName.
	index := (KeyIndex keys: series values) keys.
	
	"set the default label text"
	self label: columnName asString.
	
	"remove all the existing tick marks"
	ticks removeAll
