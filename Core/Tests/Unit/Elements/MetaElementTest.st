ElementTest subclass: MetaElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := MetaElement new
    ]

    testContent [
	<category: 'testing'>
	e content: 'foo'.
	self shouldHaveAttribute: 'content' value: 'foo'
    ]

    testHttpEquiv [
	<category: 'testing'>
	e httpEquiv: 'foo'.
	self shouldHaveAttribute: 'http-equiv' value: 'foo'
    ]

    testHttpEquivalent [
	<category: 'testing'>
	e httpEquivalent: 'foo'.
	self shouldHaveAttribute: 'http-equiv' value: 'foo'
    ]

    testName [
	<category: 'testing'>
	e name: 'foo'.
	self shouldHaveAttribute: 'name' value: 'foo'
    ]

    testScheme [
	<category: 'testing'>
	e scheme: 'foo'.
	self shouldHaveAttribute: 'scheme' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'meta'
    ]
]

