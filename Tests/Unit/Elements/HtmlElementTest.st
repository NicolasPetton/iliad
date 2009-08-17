ElementTest subclass: HtmlElementTest [

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := HtmlElement new
    ]

    testLang [
	<category: 'testing'>
	e lang: 'fr'.
	self shouldHaveAttribute: 'lang' value: 'fr'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'html'
    ]

    testVersion [
	<category: 'testing'>
	e version: 2.0.
	self shouldHaveAttribute: 'version' value: '2.0'
    ]

    testXmlns [
	<category: 'testing'>
	e xmlns: 'foo'.
	self shouldHaveAttribute: 'xmlns' value: 'foo'
    ]
]

