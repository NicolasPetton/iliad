ILChartOption subclass: ILChartLinesOption [

    <category: 'More-Charts-Options'>
    <comment: nil>

    optionName [
	<category: 'accessing'>
	^'lines'
    ]

    fill: aBoolean [
	"default is true"
	<category: 'attributes'>
	
	self attributesAt: 'fill' put: aBoolean printString
    ]

    fillColor: aString [
	<category: 'attributes'>
	self attributesAt: 'fillColor' put: '''', aString, ''''
    ]

    linewidth: anInteger [
	<category: 'attributes'>
	self attributesAt: 'lineWidth' put: anInteger printString
    ]

    show: aBoolean [
	<category: 'attributes'>
	self attributesAt: 'show' put: aBoolean printString
    ]
]

