as yet unclassified
build
	"Builds the tick marks so they may be drawn. The default implementation assumes the ticks are enumerated and not interpolating. It uses the KeyIndex, but orders the ticks by the first appearance of each in the DataFrame."
	
	ticks := index indexes collect: [:assoc | assoc key -> assoc value first].
	
	"sort the ticks by value (the first index they appear at)"
	ticks := ticks contents sorted: [:a :b | a value < b value].
	
	"finally, the change the value of each tick to be its index."
	ticks := ticks withIndexCollect: [:assoc :i |
		assoc key -> i
	].

	"the index of the key indicates the position along the axis"
	self from: 1; to: ticks size.
	