as yet unclassified
values
	"Returns the materialized, indexed values as an array."

	^primaryIndex collect: [:row | values at: row]
