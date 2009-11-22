
ILElementTest subclass: ILTableBodyElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILTableBodyElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'tbody'
    ]
]

