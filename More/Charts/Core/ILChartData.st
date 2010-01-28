ILObject subclass >> ILChartData [
    | label data options |

    <category: 'More-Charts-Core'>
    <comment: nil>
    
    data [
	<category: 'accesing'>
	^data ifNil: [data := OrderedCollection new]
    ]

    data: aCollection [
	<category: 'accessing'>
	data := aCollection
    ]

    label [
	<category: 'accessing'>
	^label ifNil: [self label: ''].
    ]

    label: aString [
	<category: 'accessing'>
	label := '''', aString, ''''
    ]

    options [
	<category: 'accessing'>
	^options ifNil: [options := Dictionary new]
    ]

    optionsAt: anObject [
	<category: 'accessing'>
	^self options at: anObject ifAbsent: [nil]
    ]

    optionsAt: aKey put: anObject [
	<category: 'accessing'>
	self options at: aKey put: anObject
    ]

    optionsAt: aKey ifAbsentPut: anObject [
	<category: 'accessing'>
	self options at: aKey ifAbsentPut: [anObject]
    ]

    addData: aCollection [
	<categoring: 'adding'>
	self data add: aCollection
    ]

    add: aPoint [
	<category: 'adding'>
	self data add: aPoint
    ]

    bars [
	<category: 'adding'>
	^self optionsAt: #bars ifAbsentPut: [ILChartBarsOption new]
    ]

    color: aString [
	<category: 'options'>
	
	self optionsAt: #color ifAbsentPut: (ILChartColorOption new
	    color: aString;
	    yourself).
	^self optionsAt: #color
    ]

    lines [
	<category: 'options'>
	^self optionsAt: #lines ifAbsentPut: ILChartLinesOption new
    ]

    points [
	<category: 'options'>
	^self optionsAt: #points ifAbsentPut: ILChartPointsOption new
    ]
]

