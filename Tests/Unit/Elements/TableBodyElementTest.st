ElementTest subclass: TableBodyElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TableBodyElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'tbody'
    ]
]

