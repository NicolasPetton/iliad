ElementTest subclass: TableHeadElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	e := TableHeadElement new
    ]

    testTag [
	self assert: e tag = 'thead'
    ]
]

