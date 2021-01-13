*DataFrames-Plots
inverseLerpFrom: start to: stop
	"Returns the % [0,1] along the axis start to stop this DateAndTime is."
	
	^(self utcMicroseconds - start utcMicroseconds) / (stop utcMicroseconds - start utcMicroseconds)
