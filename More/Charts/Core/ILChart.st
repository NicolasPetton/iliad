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
]
