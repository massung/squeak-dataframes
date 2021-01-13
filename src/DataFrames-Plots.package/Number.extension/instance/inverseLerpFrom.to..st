*DataFrames-Plots
inverseLerpFrom: start to: stop
	"Returns the % [0,1] along the axis start to stop this value is."
	
	^self - start / (stop - start)
	