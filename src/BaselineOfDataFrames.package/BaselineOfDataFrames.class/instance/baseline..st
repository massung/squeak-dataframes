as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec baseline: 'Ston' with: [
			spec repository: 'github://squeak-smalltalk/squeak-ston:squeak/repository'
		].
		
		"packages"
		spec
			package: 'DataFrames-CSV';
			package: 'DataFrames-Core' with: [spec requires: #('DataFrames-CSV' 'Ston')];
			package: 'DataFrames-Plots' with: [spec requires: #('DataFrames-Core')]
	]
