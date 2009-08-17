TestCase subclass: ApplicationTest [
    | application |
    
    <comment: nil>
    <category: 'Iliad-Tests-Buildables'>

    setUp [
	<category: 'running'>
	application := ApplicationMock1 new
    ]

    testDefaultSelectorFilter [
	<category: 'tests'>
	self assert: (application allowedSelector: #index).
	self deny: (application allowedSelector: #dispatch)
    ]

    testDispatch [
	<category: 'tests'>
	[application dispatchOn: #foo] on: Error
	    do: [:e | self assert: (e isKindOf: DispatchError)]
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

