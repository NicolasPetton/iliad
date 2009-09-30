
ElementTest subclass: XHTMLElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Elements'>

    setUp [
	<category: 'running'>
	e := XHTMLElement new
    ]

    testClass [
	<category: 'testing'>
	e class: 'foo'.
	self shouldHaveAttribute: 'class' value: 'foo'
    ]

    testId [
	<category: 'testing'>
	e id: 'foo'.
	self shouldHaveAttribute: 'id' value: 'foo'
    ]

    testLang [
	<category: 'testing'>
	e lang: 'foo'.
	self shouldHaveAttribute: 'lang' value: 'foo'
    ]

    testStyle [
	<category: 'testing'>
	e style: 'foo'.
	self shouldHaveAttribute: 'style' value: 'foo'
    ]

    testTitle [
	<category: 'testing'>
	e title: 'foo'.
	self shouldHaveAttribute: 'title' value: 'foo'
    ]

    testXmlLang [
	<category: 'testing'>
	e xmlLang: 'foo'.
	self shouldHaveAttribute: 'xml:lang' value: 'foo'
    ]
]

