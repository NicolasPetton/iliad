
ILElementTest subclass: ILHeadElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILHeadElement new
    ]

    testProfile [
	<category: 'testing'>
	e profile: 'foo'.
	self shouldHaveAttribute: 'profile' value: 'foo'
    ]

    testProfiles [
	<category: 'testing'>
	e profiles: #('foo' 'bar').
	self shouldHaveAttribute: 'profile' value: 'foo bar'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'head'
    ]

    testTitle [
	<category: 'testing'>
	| title |
	title := e title.
	self assert: (title isKindOf: ILTitleElement)
    ]
]

