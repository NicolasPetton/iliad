ElementTest subclass: TableFootElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	e := TableFootElement new
    ]

    testTag [
	self assert: e tag = 'tfoot'
    ]
]

