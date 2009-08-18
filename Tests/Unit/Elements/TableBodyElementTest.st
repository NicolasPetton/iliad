ElementTest subclass: TableBodyElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	e := TableBodyElement new
    ]

    testTag [
	self assert: e tag = 'tbody'
    ]
]

