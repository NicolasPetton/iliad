ElementTest subclass: RSSCategoryElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RSS'>

    setUp [
	<category: 'running'>
	e := RSSCategoryElement new
    ]

    testDomain [
	<category: 'testing'>
	e domain: 'foo'.
	self shouldHaveAttribute: 'domain' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'category'
    ]
]

