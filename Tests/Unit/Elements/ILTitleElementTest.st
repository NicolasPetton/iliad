
ILElementTest subclass: ILTitleElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILTitleElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'title'
    ]
]

