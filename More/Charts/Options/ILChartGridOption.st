ILChartOption subclass: ILChartGridOption [

    <category: 'More-Charts-Options'>
    <comment nil>

    borderWidth: anInteger [
	<category: 'accessing'>
	self attributesAt: #borderWidth put: anInteger printString
    ]

    borderColor: anInteger [
	<category: 'accessing'>
	self attributesAt: #borderColor put: anInteger printString
    ]

    color: aString [
	<category: 'accessing'>
	self attributesAt: #color put: '''', aString, ''''
    ]

    optionName [
	<category: 'accessing'>
	^'grid'
    ]
    
    backgroundColor: aString [
	<category: 'attributes'>
	"backgroundColor - default is null"
	self attributesAt: #backgroundColor put: '''', aString, ''''
    ]

    clickable: aBoolean [
	<category: 'attributes'>
	self attributesAt: #clickable put: aBoolean printString
    ]

    hoverable: aBoolean [
	<category: 'attributes'>
	self attributesAt: #hoverable put: aBoolean printString
    ]
    
    labelMargin: anInteger [
	<category: 'attributes'>
	self attributesAt: #labelMargin put: anInteger printString
    ]

    tickColor: aString [
	<category: 'attributes'>
	self attributesAt: #tickColor put: '''', aString, ''''
    ]

    aboveData: aBoolean [
	<category: 'attributes'>
	self attributesAt: #aboveData put: aBoolean printString
    ]

    autoHighlight: aBoolean [
	<category: 'attributes'>
	self attributesAt: #autoHighlight put: aBoolean printString
    ]

    mouseActiveRadius: anInteger [
	<category: 'attributes'>
	self attributesAt: #mouseActiveRadius put: anInteger printString
    ]
]
