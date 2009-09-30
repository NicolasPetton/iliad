ElementTest subclass: TableRowElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableRowElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'tr'
    ]
]

