ElementTest subclass: LabelElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := LabelElement new
    ]

    testAccessKey [
	<category: 'testing'>
	e accesskey: $a.
	self shouldHaveAttribute: 'accesskey' value: 'a'
    ]

    testFor [
	<category: 'testing'>
	e for: 'foo'.
	self shouldHaveAttribute: 'for' value: 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'label'
    ]
]

