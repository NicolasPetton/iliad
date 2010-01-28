TestCase subclass: ILUrlTest [
    | url |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-lib-HTTP'>

    setUp [
	<category: 'running'>
	url := ILUrl new
    ]

    testAddParameters [
	<category: 'testing'>
	url addParameter: 'foo'.
	self assert: (url parameters at: 'foo') = nil.
	url addParameter: 'foo' value: 'bar'.
	self assert: (url parameters at: 'foo') = 'bar'
    ]
]

