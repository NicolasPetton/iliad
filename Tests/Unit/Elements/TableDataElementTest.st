ElementTest subclass: TableDataElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableDataElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'td'
    ]
]

