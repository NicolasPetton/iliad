ElementTest subclass: TableHeaderElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableHeaderElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'th'
    ]
]

