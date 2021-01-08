as yet unclassified
initialize

	sepChar := $,.
	lineChar := Character cr.
	quoteChar := $".
	escapeChar := $\.
	commentChar := $#.
	arrayChar := $|.
	assocChar := $=.
	
	"parsing options"
	doubleQuote := false.
	naValues := {''. 'NA'. 'NaN'. 'nil'. 'null'}.
	naRep := ''.
