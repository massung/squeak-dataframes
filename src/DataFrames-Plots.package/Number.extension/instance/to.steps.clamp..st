*DataFrames-Plots
to: stop steps: n clamp: clamp
	"Returns an array of n step values from self to stop. If clamp is false, then the start and stop may be expanded in order to make for a better n or more even steps."
	
	| start steps step halfStep interval |
	
	"step by powers of 10"
	step := 10 ** ((stop - self / 2) log rounded - 1).
	halfStep := step / 2.
	
	"set the initial starting value"
	start := self.
	steps := n - 1.
	
	"increase the step so there are n steps on the axis"
	step := stop - start // step / steps * step + halfStep // halfStep * halfStep.
	
	"optionally clamp the extents"
	interval := clamp
		ifTrue: [start to: stop by: step]
		ifFalse: [start // step * step to: stop + step // step * step by: step].
		
	^interval asArray
	