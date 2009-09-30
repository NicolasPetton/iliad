ElementTest subclass: TableFootElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableFootElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'tfoot'
    ]
]

