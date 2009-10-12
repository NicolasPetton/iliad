ElementTest subclass: AreaElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := AreaElement new
    ]

    testAccessKey [
	<category: 'testing'>
	e accesskey: $a.
	self shouldHaveAttribute: 'accesskey' value: 'a'
    ]

    testAlternativeText [
	<category: 'testing'>
	e alt: 'foo'.
	self shouldHaveAttribute: 'alt' value: 'foo'
    ]

    testCircleShape [
	<category: 'testing'>
	e circleShape.
	self shouldHaveAttribute: 'shape' value: 'circle'
    ]

    testCoords [
	<category: 'testing'>
	e coords: 'foo'.
	self shouldHaveAttribute: 'coords' value: 'foo'
    ]

    testDefaultShape [
	<category: 'testing'>
	e polyShape.
	self shouldHaveAttribute: 'shape' value: 'poly'
    ]

    testHref [
	<category: 'testing'>
	e href: 'foo'.
	self shouldHaveAttribute: 'href' value: 'foo'
    ]

    testNoHref [
	<category: 'testing'>
	e nohref.
	self shouldHaveAttribute: 'nohref' value: 'nohref'
    ]

    testOnFocus [
	<category: 'testing'>
	e onFocus: 'foo'.
	self shouldHaveAttribute: 'onfocus' value: 'foo'
    ]

    testRectShape [
	<category: 'testing'>
	e rectShape.
	self shouldHaveAttribute: 'shape' value: 'rect'
    ]

    testShape [
	<category: 'testing'>
	e shape: 'foo'.
	self shouldHaveAttribute: 'shape' value: 'foo'
    ]

    testTabIndex [
	<category: 'testing'>
	e tabindex: 2.
	self shouldHaveAttribute: 'tabindex' value: '2'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'area'
    ]
]

