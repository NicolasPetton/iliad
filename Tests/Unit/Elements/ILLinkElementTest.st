
ILElementTest subclass: ILLinkElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILLinkElement new
    ]

    testAllMedia [
	<category: 'testing'>
	e allMedia.
	self shouldHaveAttribute: 'media' value: 'all'
    ]

    testAuralMedia [
	<category: 'testing'>
	e auralMedia.
	self shouldHaveAttribute: 'media' value: 'aural'
    ]

    testBrailleMedia [
	<category: 'testing'>
	e brailleMedia.
	self shouldHaveAttribute: 'media' value: 'braille'
    ]

    testHandheldMedia [
	<category: 'testing'>
	e handheldMedia.
	self shouldHaveAttribute: 'media' value: 'handheld'
    ]

    testMedia [
	<category: 'testing'>
	e media: 'foo'.
	self shouldHaveAttribute: 'media' value: 'foo'
    ]

    testPrintMedia [
	<category: 'testing'>
	e printMedia.
	self shouldHaveAttribute: 'media' value: 'print'
    ]

    testProjectionMedia [
	<category: 'testing'>
	e projectionMedia.
	self shouldHaveAttribute: 'media' value: 'projection'
    ]

    testScreenMedia [
	<category: 'testing'>
	e screenMedia.
	self shouldHaveAttribute: 'media' value: 'screen'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'link'
    ]

    testTtyMedia [
	<category: 'testing'>
	e ttyMedia.
	self shouldHaveAttribute: 'media' value: 'tty'
    ]

    testTvMedia [
	<category: 'testing'>
	e tvMedia.
	self shouldHaveAttribute: 'media' value: 'tv'
    ]

    testType [
	<category: 'testing'>
	e type: 'foo'.
	self shouldHaveAttribute: 'type' value: 'foo'
    ]
]

