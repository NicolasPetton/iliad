ILElementTest subclass: ILConditionalCommentElementTest [

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILConditionalCommentElement new
    ]

    testGt [
	<category: 'testing'>
	e gt.
	self assert: (e conditions includes: 'gt')
    ]

    testIe [
	<category: 'testing'>
	e ie.
	self assert: (e conditions includes: 'IE')
    ]

    testIe5 [
	<category: 'testing'>
	e ie5.
	self assert: (e conditions includes: 'IE 5')
    ]

    testIe50 [
	<category: 'testing'>
	e ie50.
	self assert: (e conditions includes: 'IE 5.0')
    ]

    testIe55 [
	<category: 'testing'>
	e ie55.
	self assert: (e conditions includes: 'IE 5.5')
    ]

    testIe6 [
	<category: 'testing'>
	e ie6.
	self assert: (e conditions includes: 'IE 6')
    ]

    testIe7 [
	<category: 'testing'>
	e ie7.
	self assert: (e conditions includes: 'IE 7')
    ]

    testIe8 [
	<category: 'testing'>
	e ie8.
	self assert: (e conditions includes: 'IE 8')
    ]

    testLt [
	<category: 'testing'>
	e lt.
	self assert: (e conditions includes: 'lt')
    ]

    testNot [
	<category: 'testing'>
	e not.
	self assert: (e condtions includes: '!')
    ]
]
