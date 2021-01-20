*DataFrames-Plots
to: stop steps: n clamp: clamp
	"Returns a list of Timespan objects nicely in the range of self to stop."
	
	^(self asDateAndTime to: stop asDateAndTime steps: n clamp: clamp)
		collect: [:dt | dt asDate]