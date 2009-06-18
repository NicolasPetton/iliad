ElementTest subclass: ImageElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ImageElement new
    ]

    testAlternativeText [
	<category: 'testing'>
	e alternativeText: 'foo'.
	self shouldHaveAttribute: 'alt' value: 'foo'
    ]

    testHeight [
	<category: 'testing'>
	e height: 300.
	self shouldHaveAttribute: 'height' value: '300'
    ]

    testIsMap [
	<category: 'testing'>
	e isMap.
	self shouldHaveAttribute: 'ismap' value: 'ismap'
    ]

    testLongDescription [
	<category: 'testing'>
	e longDescription: 'foo bar'.
	self shouldHaveAttribute: 'longdesc' value: 'foo bar'
    ]

    testSource [
	<category: 'testing'>
	e source: 'foo'.
	self shouldHaveAttribute: 'src' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'img'
    ]

    testUsemap [
	<category: 'testing'>
	e useMap: 'foo'.
	self shouldHaveAttribute: 'usemap' value: 'foo'
    ]

    testWidth [
	<category: 'testing'>
	e width: 200.
	self shouldHaveAttribute: 'width' value: '200'
    ]
]

