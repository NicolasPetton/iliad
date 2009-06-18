TestCase subclass: CurrentContextTest [
    | context |
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Sessions'>

    setUp [
	<category: 'running'>
	context := Context new
    ]

    tearDown [
	<category: 'running'>
	context := nil
    ]

    testCurrentContext [
	<category: 'testing'>
	CurrentContext use: context
	    during: [self assert: CurrentContext value = context].
	self assert: CurrentContext value = nil
    ]
]

