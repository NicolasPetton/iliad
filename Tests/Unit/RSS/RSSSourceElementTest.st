

ElementTest subclass: RSSSourceElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-RSS'>

    setUp [
	<category: 'running'>
	e := RSSSourceElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'source'
    ]

    testUrl [
	<category: 'testing'>
	e url: 'foo'.
	self shouldHaveAttribute: 'url' value: 'foo'
    ]
]

