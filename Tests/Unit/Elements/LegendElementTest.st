ElementTest subclass: LegendElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := LegendElement new
    ]

    testAccessKey [
	<category: 'testing'>
	e accesskey: $a.
	self shouldHaveAttribute: 'accesskey' value: 'a'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'legend'
    ]
]

