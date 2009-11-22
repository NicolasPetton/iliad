
ILElementTest subclass: ILTableHeadElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILTableHeadElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'thead'
    ]
]

