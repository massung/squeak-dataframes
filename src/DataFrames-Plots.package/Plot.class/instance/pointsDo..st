as yet unclassified
pointsDo: aBlock
	"Stream all the x,y points to aBlock as two separate parameters."
	
	figure ifNotNil: [
		figure x series with: figure y series do: [:x :y |
			x notNil & y notNil ifTrue: [
				aBlock value: (figure x pointAt: x) @ (figure y pointAt: y)
			]
		]
	]
	