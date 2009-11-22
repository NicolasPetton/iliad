
ILElementTest subclass: ILTableRowElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILTableRowElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'tr'
    ]
]

