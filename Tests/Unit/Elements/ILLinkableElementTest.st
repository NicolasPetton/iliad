
ILElementTest subclass: ILLinkableElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILLinkableElement new
    ]

    testAttributes [
	<category: 'testing'>
	e beNext.
	self shouldHaveAttribute: 'rel' value: 'Next'.
	e beChapter.
	self shouldHaveAttribute: 'rel' value: 'Chapter'.
	e beStart.
	self shouldHaveAttribute: 'rel' value: 'Start'.
	e fromContents.
	self shouldHaveAttribute: 'rev' value: 'Contents'.
	e beIndex.
	self shouldHaveAttribute: 'rel' value: 'Index'.
	e fromPrevious.
	self shouldHaveAttribute: 'rev' value: 'Prev'.
	e fromHelp.
	self shouldHaveAttribute: 'rev' value: 'Help'.
	e beBookmark.
	self shouldHaveAttribute: 'rel' value: 'Bookmark'.
	e fromIndex.
	self shouldHaveAttribute: 'rev' value: 'Index'.
	e beGlossary.
	self shouldHaveAttribute: 'rel' value: 'Glossary'.
	e fromAlternate.
	self shouldHaveAttribute: 'rev' value: 'Alternate'.
	e fromStylesheet.
	self shouldHaveAttribute: 'rev' value: 'Stylesheet'.	
	e beHelp.
	self shouldHaveAttribute: 'rel' value: 'Help'.
	e beAppendix.
	self shouldHaveAttribute: 'rel' value: 'Appendix'.
	e fromAppendix.
	self shouldHaveAttribute: 'rev' value: 'Appendix'.
	e fromNext.
	self shouldHaveAttribute: 'rev' value: 'Next'.
	e bePrev.
	self shouldHaveAttribute: 'rel' value: 'Prev'.
	e fromChapter.
	self shouldHaveAttribute: 'rev' value: 'Chapter'.
	e beSubsection.
	self shouldHaveAttribute: 'rel' value: 'Subsection'.
	e beCopyright.
	self shouldHaveAttribute: 'rel' value: 'Copyright'.
	e beAlternate.
	self shouldHaveAttribute: 'rel' value: 'Alternate'.
	e fromBookmark.
	self shouldHaveAttribute: 'rev' value: 'Bookmark'.
	e bePrevious.
	self shouldHaveAttribute: 'rel' value: 'Prev'.
	e fromCopyright.
	self shouldHaveAttribute: 'rev' value: 'Copyright'.
	e fromSection.
	self shouldHaveAttribute: 'rev' value: 'Section'.
	e fromSubsection.
	self shouldHaveAttribute: 'rev' value: 'Subsection'.
	e fromStart.
	self shouldHaveAttribute: 'rev' value: 'Start'.
	e beSection.
	self shouldHaveAttribute: 'rel' value: 'Section'.
	e fromPrev.
	self shouldHaveAttribute: 'rev' value: 'Prev'.
	e beContents.
	self shouldHaveAttribute: 'rel' value: 'Contents'.
	e fromGlossary.
	self shouldHaveAttribute: 'rev' value: 'Glossary'
    ]

    testCharset [
	<category: 'testing'>
	e charset: 'foo'.
	self shouldHaveAttribute: 'charset' value: 'foo'
    ]

    testContentType [
	<category: 'testing'>
	e contentType: 'foo'.
	self shouldHaveAttribute: 'type' value: 'foo'
    ]

    testHref [
	<category: 'testing'>
	e href: 'foo'.
	self shouldHaveAttribute: 'href' value: 'foo'
    ]

    testHrefLang [
	<category: 'testing'>
	e hreflang: 'foo'.
	self shouldHaveAttribute: 'hreflang' value: 'foo'
    ]

    testRel [
	<category: 'testing'>
	e rel: 'foo'.
	self shouldHaveAttribute: 'rel' value: 'foo'
    ]

    testRev [
	<category: 'testing'>
	e rev: 'foo'.
	self shouldHaveAttribute: 'rev' value: 'foo'
    ]

    testType [
	<category: 'testing'>
	e type: 'foo'.
	self shouldHaveAttribute: 'type' value: 'foo'
    ]
]

