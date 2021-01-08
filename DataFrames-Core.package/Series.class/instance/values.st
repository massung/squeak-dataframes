as yet unclassified
values
	"Returns the materialized, indexed values as an array."

	^recordIndex collect: [:row | values at: row]
