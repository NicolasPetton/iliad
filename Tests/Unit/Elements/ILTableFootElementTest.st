
ILElementTest subclass: ILTableFootElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILTableFootElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'tfoot'
    ]
]

