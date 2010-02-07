Eval [
    PackageBuilder new
	name: 'Iliad-More-Charts';
	namespace: 'Iliad';

	prereq: 'Iliad-Core';

	filein: 'Core/ILChart.st';
	filein: 'Core/ILChartData.st';
	
	filein: 'Options/ILChartOption.st';
	filein: 'Options/ILChartColorsOption.st';
	filein: 'Options/ILChartGridOption.st';
	filein: 'Options/ILChartLegendOption.st';
	filein: 'Options/ILChartLinesOption.st';
	filein: 'Options/ILChartBarsOption.st';
	filein: 'Options/ILChartPointsOption.st';
	filein: 'Options/ILChartSelectionOption.st';
	filein: 'Options/ILChartXaxisOption.st';
	filein: 'Options/ILChartYaxisOption.st';

	buildXml
    ]
