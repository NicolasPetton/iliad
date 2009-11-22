
ILElementTest subclass: ILParagraphElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILParagraphElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'p'
    ]
]

