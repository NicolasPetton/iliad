
ILElementTest subclass: ILListItemElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILListItemElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'li'
    ]
]

