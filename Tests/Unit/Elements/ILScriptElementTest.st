
ILElementTest subclass: ILScriptElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILScriptElement new
    ]

    testBeJavascript [
	<category: 'testing'>
	e beJavascript.
	self shouldHaveAttribute: 'type' value: 'text/javascript'
    ]

    testCharSet [
	<category: 'testing'>
	e charset: 'foo'.
	self shouldHaveAttribute: 'charset' value: 'foo'
    ]

    testDefer [
	<category: 'testing'>
	e defer.
	self shouldHaveAttribute: 'defer' value: 'defer'
    ]

    testLanguage [
	<category: 'testing'>
	e language: 'foo'.
	self shouldHaveAttribute: 'language' value: 'foo'
    ]

    testSrc [
	<category: 'testing'>
	e src: 'foo'.
	self shouldHaveAttribute: 'src' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'script'
    ]

    testType [
	<category: 'testing'>
	e type: 'foo'.
	self shouldHaveAttribute: 'type' value: 'foo'
    ]
]

