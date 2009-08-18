ElementTest subclass: TitleElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	e := TitleElement new
    ]

    testTag [
	self assert: e tag = 'title'
    ]
]

