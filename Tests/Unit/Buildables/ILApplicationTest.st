TestCase subclass: ILApplicationTest [
    | application |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Buildables'>

    setUp [
	<category: 'running'>
	application := ILApplicationMock1 new
    ]

    testDefaultSelectorFilter [
	<category: 'tests'>
	self assert: (application allowedSelector: #index).
	self deny: (application allowedSelector: #dispatch)
    ]

    testDispatch [
	<category: 'tests'>
	[application dispatchOn: #foo] on: Error
	    do: [:e | self assert: (e isKindOf: ILDispatchError)]
    ]

    testMode [
	<category: 'tests'>
	application class verboseMode.
	self assert: application isVerboseMode.
	self deny: application isDeploymentMode.
	self deny: application isDebugMode.
	application class mode: #deployment.
	self assert: application isDeploymentMode.
	application class mode: #debug.
	self assert: application isDebugMode
    ]
]

