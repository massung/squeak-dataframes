as yet unclassified
column: columnName
	"Sets the column name this axis draws from."
	
	series := figure dataFrame at: columnName.
	index := KeyIndex keys: series values.
	
	"set the default label text"
	self label: columnName asString.
	
	"remove all the existing tick marks; #build will be alled the next #drawOn:"
	ticks := Array new
