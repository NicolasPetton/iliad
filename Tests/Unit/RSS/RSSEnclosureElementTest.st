ElementTest subclass: RSSEnclosureElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RSS'>

    setUp [
	<category: 'running'>
	e := RSSEnclosureElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'enclosure'
    ]

    testType [
	<category: 'testing'>
	e type: 'foo'.
	self shouldHaveAttribute: 'type' value: 'foo'
    ]

    testUrl [
	<category: 'testing'>
	e url: 'foo'.
	self shouldHaveAttribute: 'url' value: 'foo'
    ]

    testlength [
	<category: 'testing'>
	e length: 123456789.
	self shouldHaveAttribute: 'length' value: '123456789'
    ]
]

