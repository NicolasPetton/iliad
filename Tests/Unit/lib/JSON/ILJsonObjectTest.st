TestCase subclass: ILJsonObjectTest [

    <category: 'Iliad-Tests-Unit-lib-JSON'>
    <comment: nil>

    setUp [
	<category: 'running'>
	jo := ILJsonObject new
    ]

    testProperties [
	<category: 'testing'>
	self assert: (jo at: 'foo') = nil.
	jo at: 'foo' put: 'bar'.
	self assert: (jo properties includes: ('foo' -> 'bar'))
    ]
]
