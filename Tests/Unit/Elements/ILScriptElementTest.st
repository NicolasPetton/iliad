
ILElementTest subclass: ILScriptElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILScriptElement new
    ]

    testCharSet [
	<category: 'testing'>
	e charset: 'foo'.
	self shouldHaveAttribute: 'charset' value: 'foo'
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

