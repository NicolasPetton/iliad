ElementTest subclass: TableDataElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	e := TableDataElement new
    ]

    testTag [
	self assert: e tag = 'td'
    ]
]

