ElementTest subclass: LinkableElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := LinkableElement new
    ]

    testHref [
	<category: 'testing'>
	e href: 'foo'.
	self shouldHaveAttribute: 'href' value: 'foo'
    ]

    testHrefLang [
	<category: 'testing'>
	e hrefLang: 'foo'.
	self shouldHaveAttribute: 'hreflang' value: 'foo'
    ]

    testRel [
	<category: 'testing'>
	e rel: 'foo'.
	self shouldHaveAttribute: 'rel' value: 'foo'
    ]

    testRev [
	<category: 'testing'>
	e rev: 'foo'.
	self shouldHaveAttribute: 'rev' value: 'foo'
    ]

    testType [
	<category: 'testing'>
	e type: 'foo'.
	self shouldHaveAttribute: 'type' value: 'foo'
    ]
]

