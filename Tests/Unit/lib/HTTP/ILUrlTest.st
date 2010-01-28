TestCase subclass: ILUrlTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-lib-HTTP'>

    testAddParameters [
	<category: 'testing'>
	| url |
	url := ILUrl new.
	url addParameter: 'foo'.
	self assert: (url parameters at: 'foo') = nil.
	url addParameter: 'foo' value: 'bar'.
	self assert: (url parameters at: 'foo') = 'bar'
    ]

    testParsing [
	<category: 'testing'>
	| url |
	url := ILUrl absolute: 'http://nico@www.example.com:8888/foo/bar.html?param1=value1&param2=value2'.
	self assert: url username = 'nico'.
	self assert: url scheme = 'http'.
	self assert: url hostname = 'www.example.com'.
	self assert: url port = 8888.
	self assert: url path size = 2.
	self assert: url path first = 'foo'.
	self assert: url path last = 'bar.html'.
	self assert: (url parameters at: 'param1') = 'value1'.
	self assert: (url parameters at: 'param2') = 'value2'.
    ]
]

