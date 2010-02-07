ILWidget subclass: ILChart [
    | chartId datas size |
    
    <category: 'Iliad-More-Charts-Core'>
    <comment: nil>

    size [
	<category: 'accessing'>
	^size ifNil: [300@300]
    ]

    datas [
	<category: 'accessing'>
	^datas ifNil: [datas := OrderedCollection new]
    ]
 
    addData: aCollection [
	<category: 'accessing'>
	self datas add: aCollection
    ]
   
    options [
	<category: 'accessing'>
	^options ifNil: [options := Dictionary new]
    ]

    optionsAt: anObject [
	<category: 'accessing'>
	^self options at: anObject ifAbsent: [nil]
    ]

    optionsAt: aKey ifAbsentPut: anObject [
	<category: 'accessing'>
	^self options at: aKey ifAbsentPut: [anObject]
    ]

    optionsAt: aKey put: anObject [
	<category: 'accessing'>
	self options at: aKey put: anObject
    ]

    bars [
	<category: 'options'>
	self optionsAt: #bars ifAbsentPut: ILChartBarsOption new.
	^self optionsAt: #bars
    ]

    colors: aCollection [
	"Colors used to draw the graph"
	<category: 'options'>

	self optionsAt: #colors ifAbsentPut: (ILChartColorsOption new
	    colors: aCollection;
	    yourself).
	^self optionsAt: #colors
    ]

    grid [
	<category: 'options'>
	self optionsAt: #grid ifAbsentPut: ILChartGridOption new.
	^self optionsAt: #grid
    ]

    legend [
	<category: 'options'>
	self optionsAt: #legend ifAbsentPut: ILChartLegendOption new.
	^self optionsAt: #legend
    ]

    lines [
	<category: 'options'>
	self optionsAt: #lines ifAbsentPut: ILChartLinesOption new.
	^self optionsAt: #lines
    ]

    points [
	<category: 'options'>
	self optionsAt: #points ifAbsentPut: ILChartsPointsOption new.
	^self optionsAt: #points
    ]

    selection [
	<category: 'accessing'>
	self optionsAt: #selection ifAbsentPut: ILChartSelectionOption new.
	^self optionsAt: #selection
    ]

    xaxis [
	<category: 'accessing'>
	self optionsAt: #xaxis ifAbsentPut: ILChartXaxisOption new.
	^self optionsAt: #xaxis
    ]

    yaxis [
	<category: 'accessing'>
	self optionsAt: #yaxis ifAbsentPut: ILChartYaxisOption new.
	^self optionsAt: #yaxis
    ]

    chartId [
	<category: 'accessing'>
	^chartId ifNil: [chartId := ILId new]
    ]

    scripts [
	<category: 'building'>
	^#('/javascripts/flot/jquery.flot.js')
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e div 
		id: self chartId;
		style: 
		    'width: ', self size x printString, 'px;',
		    'height: ', self size y printString, 'px';
		script: self chartScript]
    ]

    chartScript [
	<category: 'building'>
	^'jQuery.plot(jQuery("#', self chartId, '"), ', self jsonDatas,')'
    ]

    jsonDatas [
	<category: 'building'>
	| stream |
	stream := WriteStream on: ''.
	(self datas collect: [:each |
	    each collect: [:data | 
		{data x. data y}]])
		    printJsonOn: stream.
	^stream contents
    ]

    jsonOptions [
	<category: 'building'>
	| stream |
	stream := WriteStream on: ''.
	(self options values do: [:each |
	    each printJsonOn: stream]
	separatedBy: [aStream nextPut: $,]).
	^stream contents
    ]
]
