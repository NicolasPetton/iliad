ElementTest subclass: TitleElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TitleElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'title'
    ]
]

