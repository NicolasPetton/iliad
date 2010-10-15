ILChartOption subclass: ILChartColorsOption [
    | color |


    <category: 'More-Charts-Options'>
    <comment: nil>

    colors [
	<category: 'accessing'>
	^colors
    ]

    colors: aCollection [
	<category: 'accessing'>
	colors := aCollection
    ]

    optionName [
	<category: 'accessing'>
	^'colors'
    ]

    printJsonOn: aStream [
	<category: 'building'>
	aStream nextPutAll: self optionName, ': '.
	aStream nextPutAll: '['.
	self colors do: [:each |
	    aStream nextPutAll: '''', each, '''' ]
	separatedBy: [aStream nextPut: $,].
	aStream nextPutAll: ']'
    ]
]
