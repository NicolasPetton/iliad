ILObject subclass: ILChartOption [
    | attributes |

    <category: 'More-Charts-Options'>
    <comment: nil>
    
    attributes [
	<category: 'accessing'>
	^attributes ifNil: [attributes := Dictionary new]
    ]

    atributesAt: aKey [
	<category: 'accessing'>
	^self attributes at: aKey ifAbsent: [nil]
    ]

    attributesAt: aKey put: aValue [
	<category: 'accessing'>
	^self attributes at: aKey put: aValue
    ]

    optionName [
	<category: 'accessing'>
	self subclassResponsability
    ]
]
