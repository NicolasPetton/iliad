ILChartOption subclass: ILChartSelectionOption [

    <category: 'More-Charts-Options'>

    optionName [
	<category: 'accessing'>
	^'selection'
    ]

    color: aString [
	<category: 'attributes'>
	self attributesAt: #color put: '''', aString, ''''
    ]

    mode: aString [
	" null or time "
	<category: 'attributes'>
	self attributesAt: 'mode' put: aString
    ]
]
