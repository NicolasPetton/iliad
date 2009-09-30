ElementTest subclass: ParagraphElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ParagraphElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'p'
    ]
]

