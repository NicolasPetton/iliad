ElementTest subclass: AreaElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := AreaElement new
    ]

    testAccessKey [
	<category: 'testing'>
	e accessKey: 'a'.
	self shouldHaveAttribute: 'accesskey' value: 'a'
    ]

    testAlternativeText [
	<category: 'testing'>
	e alternativeText: 'foo'.
	self shouldHaveAttribute: 'alt' value: 'foo'
    ]

    testCoords [
	<category: 'testing'>
	e coords: 'foo'.
	self shouldHaveAttribute: 'coords' value: 'foo'
    ]

    testHref [
	<category: 'testing'>
	e href: 'foo'.
	self shouldHaveAttribute: 'href' value: 'foo'
    ]

    testNoHref [
	<category: 'testing'>
	e noHref.
	self shouldHaveAttribute: 'nohref' value: 'nohref'
    ]

    testOnFocus [
	<category: 'testing'>
	e onFocus: 'foo'.
	self shouldHaveAttribute: 'onfocus' value: 'foo'
    ]

    testShape [
	<category: 'testing'>
	e shape: 'foo'.
	self shouldHaveAttribute: 'shape' value: 'foo'
    ]

    testTabIndex [
	<category: 'testing'>
	e tabIndex: 2.
	self shouldHaveAttribute: 'tabindex' value: '2'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'area'
    ]
]

