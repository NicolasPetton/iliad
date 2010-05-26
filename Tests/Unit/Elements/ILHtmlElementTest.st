
ILElementTest subclass: ILHtmlElementTest [

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILHtmlElement new
    ]

    testBeforePrintHtml [
	<category: 'testing'>
	| session context |
	session := ILSession new. session language: #fr.
	context := ILContext new session: session.
	ILCurrentContext 
	    use: context
	    during: [	
		e beforePrintHtml.
		self shouldHaveAttribute: 'lang' value: 'fr'.
			
		e xmlns: 'foo'. e lang: 'bar'. e xmlLang: 'baz'.
		e beforePrintHtml.
		self shouldHaveAttribute: 'xmlns' value: 'foo'.
		self shouldHaveAttribute: 'lang' value: 'bar']
	]

    testDocType [
	<category: 'testing'>
	| doctype |
	self withContextDo: [e printHtmlOn: '' writeStream].
	doctype := e doctype.
	self assert: (doctype = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">')
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

    testXmlTag [
	<category: 'testing'>
	| xmlTag |
	self withContextDo: [
	    e printHtmlOn: '' writeStream.
	    self assert: (e xmlTag = '<?xml version="1.0" encoding="utf-8"?>')]
    ]
]

