ElementTest subclass: CheckboxElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := CheckboxElement new
    ]

    testAccessKey [
	<category: 'testing'>
	e accesskey: $a.
	self shouldHaveAttribute: 'accesskey' value: 'a'
    ]

    testChecked [
	<category: 'testing'>
	e checked: true.
	self shouldHaveAttribute: 'checked' value: 'checked'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'input'
    ]
]
