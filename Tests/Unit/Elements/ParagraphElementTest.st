ElementTest subclass: ParagraphElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Elements'>

    setUp [
	e := ParagraphElement new
    ]

    testTag [
	self assert: e tag = 'p'
    ]
]

