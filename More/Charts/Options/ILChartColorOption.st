ILChartOption subclass: ILChartColorOption [
    | color |


    <category: 'More-Charts-Options'>
    <comment: nil>

    colors [
	<category: 'accessing'>
	^colors
    ]

    color: aString [
	<category: 'accessing'>
	color := aString
    ]

    optionName [
	<category: 'accessing'>
	^'color'
    ]
]
