
ElementTest subclass: XHTMLElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Elements'>

    setUp [
	e := XHTMLElement new
    ]

    testClass [
	e class: 'foo'.
	self shouldHaveAttribute: 'class' value: 'foo'
    ]

    testId [
	e id: 'foo'.
	self shouldHaveAttribute: 'id' value: 'foo'
    ]

    testLang [
	e lang: 'foo'.
	self shouldHaveAttribute: 'lang' value: 'foo'
    ]

    testStyle [
	e style: 'foo'.
	self shouldHaveAttribute: 'style' value: 'foo'
    ]

    testTitle [
	e title: 'foo'.
	self shouldHaveAttribute: 'title' value: 'foo'
    ]

    testXmlLang [
	e xmlLang: 'foo'.
	self shouldHaveAttribute: 'xml:lang' value: 'foo'
    ]
]

