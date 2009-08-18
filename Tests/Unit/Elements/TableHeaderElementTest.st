ElementTest subclass: TableHeaderElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	e := TableHeaderElement new
    ]

    testTag [
	self assert: e tag = 'th'
    ]
]

