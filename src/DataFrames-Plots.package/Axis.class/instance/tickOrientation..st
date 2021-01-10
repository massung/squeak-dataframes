as yet unclassified
tickOrientation: aSymbol
	"Set the orientation of each tick label to either #horizontal or #vertical."
	
	| validOrientations |
	
	"allow for some alternate, shorter names"
	validOrientations := Dictionary newFrom: {
		#horizontal -> #horizontal.
		#vertical -> #vertical.
		#x -> #horizontal.
		#y -> #vertical.
	}.
	
	tickOrientation := validOrientations at: aSymbol
