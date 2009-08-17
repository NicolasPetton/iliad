ElementTest subclass: TextElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := TextElement new
    ]

    testAdd [
	<category: 'testing'>
	self should: [e add: Element new] raise: ElementError
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = nil
    ]
]

