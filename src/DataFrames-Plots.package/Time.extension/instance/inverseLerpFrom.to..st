*DataFrames-Plots
inverseLerpFrom: start to: stop
	"Returns the % [0,1] along the axis start to stop this Time is."
	
	^(self asNanoSeconds - start asNanoSeconds) / (stop asNanoSeconds - start asNanoSeconds)
