
ILElementTest subclass: ILTextElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILTextElement new
    ]

    testAdd [
	<category: 'testing'>
	self should: [e add: ILElement new] raise: ILElementError
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = nil
    ]
]

