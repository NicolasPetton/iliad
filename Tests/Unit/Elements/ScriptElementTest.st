ElementTest subclass: ScriptElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ScriptElement new
    ]

    testCharSet [
	<category: 'testing'>
	e charSet: 'foo'.
	self shouldHaveAttribute: 'charset' value: 'foo'
    ]

    testLanguage [
	<category: 'testing'>
	e language: 'foo'.
	self shouldHaveAttribute: 'language' value: 'foo'
    ]

    testSrc [
	<category: 'testing'>
	e source: 'foo'.
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

