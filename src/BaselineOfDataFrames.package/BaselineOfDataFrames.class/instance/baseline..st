as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec
			package: 'DataFrames-CSV';
			package: 'DataFrames-Core' with: [spec requires: #('DataFrames-CSV' 'Ston')];
			package: 'DataFrames-Plots' with: [spec requires: #('DataFrames-Core')]
	]