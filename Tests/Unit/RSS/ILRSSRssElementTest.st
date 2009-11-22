
ILElementTest subclass: ILRSSRssElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RSS'>

    setUp [
	<category: 'running'>
	e := ILRSSRssElement new
    ]

    testBlogChannel [
	<category: 'testing'>
	e blogChannel: 'foo'.
	self shouldHaveAttribute: 'xmlns:blogChannel' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'rss'
    ]

    testVersion [
	<category: 'testing'>
	e version: 1.
	self shouldHaveAttribute: 'version' value: '1'
    ]

    testXmlTag [
	<category: 'testing'>
	| xmlTag |
	xmlTag := e xmlTag.
	self assert: xmlTag = '<?xml version="1.0"?>'
    ]

    testXmlns [
	<category: 'testing'>
	e xmlns: 'foo'.
	self shouldHaveAttribute: 'xmlns' value: 'foo'
    ]
]

