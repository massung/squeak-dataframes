as yet unclassified
points
	"Return a list of all the points."
	
	^figure
		ifNil: [#()]
		ifNotNil: [
			figure x series with: figure y series collect: [:x :y |
				(figure x pointAt: x) @ (figure y pointAt: y)
			]
		]
