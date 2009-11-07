ElementTest subclass: RSSGuidElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RSS'>

    setUp [
	<category: 'running'>
	e := RSSGuidElement new
    ]

    testIsPermaLink [
	<category: 'testing'>
	e isPermaLink: true.
	self shouldHaveAttribute: 'isPermaLink' value: 'true'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'guid'
    ]
]

