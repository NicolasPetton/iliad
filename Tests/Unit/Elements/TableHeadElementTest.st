ElementTest subclass: TableHeadElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableHeadElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'thead'
    ]
]

