ElementTest subclass: MetaElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := MetaElement new
    ]

    testAttributes [
	<category: 'testing'>
	e expires.
	self shouldHaveAttribute: 'http-equiv' value: 'expires'.
	e refresh.
	self shouldHaveAttribute: 'http-equiv' value: 'refresh'.
	e contentType.
	self shouldHaveAttribute: 'http-equiv' value: 'content-type'.
	e setCookie.
	self shouldHaveAttribute: 'http-equiv' value: 'set-cookie'
    ]

    testContent [
	<category: 'testing'>
	e content: 'foo'.
	self shouldHaveAttribute: 'content' value: 'foo'
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

