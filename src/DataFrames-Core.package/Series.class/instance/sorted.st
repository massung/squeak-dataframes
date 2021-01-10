as yet unclassified
sorted
	"Returns a new Series, but with sorted values."
	
	^self sorted: [:a :b | a < b]