ILChartOption subclass: ILChartLegendOption [
    
    <category: 'More-Charts-Options'>
    <comment: nil>

    optionName [
	<category: 'accessing'>
	^'legend'
    ]

    backgroundColor: aString [
	<category: 'accessing'>
	self attributesAt: 'backgroundColor' put: '''', aString, ''''
    ]

    backgroundOpacity: aFloat [
	<category: 'attributes'>
	self attributesAt: 'backgroundOpacity' put: '''', aFloat printString, ''''
    ]

    container: aString [
	"If you want the legend to appear somewhere else in the DOM, you can specify
	container as a jQuery object/expression to put the legend table into."
	<category: 'attributes'>

	self attributesAt: 'container' put: '''', aString, ''''
    ]

    margin: anInteger [
	<category: 'attributes'>
	self attributesAt: 'margin' put: anInteger printString
    ]

    position: aString [
	" ne or: nw or: se or: sw"
	<category: 'attributes'>
	
	self attributesAt: 'position' put: '''', aString, ''''
    ]

    noColumns: anInteger [
	"Number of columns for legend."
	<category: 'attributes'>
	self attributesAt: 'noColumns' put: anInteger printString
    ]

    labelBoxBorderColor: aString [
	"border color for the little label boxes."
	<category: 'attributes'>

	self attributesAt: 'labelBoxBorderColor' put: '''', aString, ''''
    ]

    labelFormatter: anObject [
	"A function that returns a string. The function is called with a string
	and is expected to return a string. Default = null"
	<category: 'attributes'>
    
	self notYetImplemented
    ]

    show: aBoolean [
	"If you want to show the legend. Default is false"
	<category: 'attributes'>

	self attributesAt: 'show' put: aBoolean printString
    ]
]
