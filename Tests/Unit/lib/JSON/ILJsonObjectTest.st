TestCase subclass: ILJsonObjectTest [

    <category: 'Iliad-Tests-Unit-lib-JSON'>
    <comment: nil>

    testProperties [
	<category: 'testing'>
	| jsonObject |
	jsonObject := ILJsonObject new.
	self assert: (jsonObject at: 'foo') = nil.
	jsonObject at: 'foo' put: 'bar'
    ]
]
