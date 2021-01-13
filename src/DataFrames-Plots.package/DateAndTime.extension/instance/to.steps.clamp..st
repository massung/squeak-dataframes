*DataFrames-Plots
to: stop steps: n clamp: clamp
	"Returns a list of DateAndTime objects nicely in the range of self to stop."
	
	| span durations units stepUnit setStepUnit |
	
	span := self to: stop.
	
	"determine the largest unit size to step by"
	units := #(nanoSeconds seconds minutes hours days).
	stepUnit := units at: (units findLast: [:unit | (span duration perform: unit) > 0]).
	setStepUnit := (stepUnit , ':') asSymbol.
	
	"use the Number steps for even durations"
	durations := 0 to: (span duration perform: stepUnit) steps: n clamp: clamp.
	
	"that step is the final duration step"
	^durations collect: [:duration |
		self + (Duration perform: setStepUnit with: duration)
	]
	