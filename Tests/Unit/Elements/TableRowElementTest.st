ElementTest subclass: TableRowElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	e := TableRowElement new
    ]

    testTag [
	self assert: e tag = 'tr'
    ]
]

