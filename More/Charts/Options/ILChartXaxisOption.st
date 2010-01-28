ILChartOption subclass: ILChartXaxisOption [

    <category: 'accessing'>
    <comment: nil>

    optionName [
	<category: 'accessing'>
	^'xaxis'
    ]

    autoscaleMargin: aFloat [
	<category: 'attributes'>
	self attributesAt: #autoscaleMargin put: aFloat printString
    ]

    max: anInteger [
	<category: 'attributes'>
	self attributesAt: #max put: anInteger printString
    ]

    min: anInteger [
	<category: 'attributes'>
	self attributesAt: #min put: anInteger printString
    ]

    minTickSize: anInteger [
	<category: 'attributes'>
	self attributesAt: #minTickSize put: anInteger printString
    ]

    tickDecimals: aFloat [
	<category: 'attributes'>
	self attributesAt: #tickDecimals put: aFloat printString
    ]

    tickSize: anInteger [
	<category: 'attributes'>
	self attributesAt: #tickSize put: anInteger printString
    ]

    ticks: aString [
	<category: 'attributes'>
	self attributesAt: #ticks put: aString
    ]
]
