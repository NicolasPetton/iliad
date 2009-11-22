
TestCase subclass: ILCurrentContextTest [
    | context |
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Sessions'>

    setUp [
	<category: 'running'>
	context := ILContext new
    ]

    testCurrentContext [
	<category: 'testing'>
	ILCurrentContext use: context
	    during: [self assert: ILCurrentContext value = context].
	self assert: ILCurrentContext value = nil
    ]
]

