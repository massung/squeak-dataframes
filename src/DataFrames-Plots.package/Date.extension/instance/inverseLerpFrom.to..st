*DataFrames-Plots
inverseLerpFrom: start to: stop
	"Returns the % [0,1] along the axis start to stop this Date is."
	
	^self asDateAndTime inverseLerpFrom: start asDateAndTime to: stop asDateAndTime
