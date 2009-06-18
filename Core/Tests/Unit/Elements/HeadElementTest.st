ElementTest subclass: HeadElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := HeadElement new
    ]

    testProfile [
	<category: 'tests'>
	e profile: 'foo'.
	self shouldHaveAttribute: 'profile' value: 'foo'
    ]

    testProfiles [
	<category: 'tests'>
	e profiles: #('foo' 'bar').
	self shouldHaveAttribute: 'profile' value: 'foo bar'
    ]

    testTag [
	<category: 'tests'>
	self assert: e tag = 'head'
    ]
]

