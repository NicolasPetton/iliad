
ILElementTest subclass: ILImageElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILImageElement new
    ]

    testAlternativeText [
	<category: 'testing'>
	e alt: 'foo'.
	self shouldHaveAttribute: 'alt' value: 'foo'
    ]

    testHeight [
	<category: 'testing'>
	e height: 300.
	self shouldHaveAttribute: 'height' value: '300'
    ]

    testIsMap [
	<category: 'testing'>
	e ismap.
	self shouldHaveAttribute: 'ismap' value: 'ismap'
    ]

    testLongDescription [
	<category: 'testing'>
	e longdesc: 'foo bar'.
	self shouldHaveAttribute: 'longdesc' value: 'foo bar'
    ]

    testSource [
	<category: 'testing'>
	e src: 'foo'.
	self shouldHaveAttribute: 'src' value: 'foo'
    ]

    testSrcAlt [
	<category: 'testing'>
	e src: 'http://www.google.com' alt: 'foo'.
	self shouldHaveAttribute: 'src' value: 'http://www.google.com'.
	self shouldHaveAttribute: 'alt' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'img'
    ]

    testUsemap [
	<category: 'testing'>
	e usemap: 'foo'.
	self shouldHaveAttribute: 'usemap' value: 'foo'
    ]

    testWidth [
	<category: 'testing'>
	e width: 200.
	self shouldHaveAttribute: 'width' value: '200'
    ]
]

