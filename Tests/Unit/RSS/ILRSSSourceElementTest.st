
ILElementTest subclass: ILRSSSourceElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RSS'>

    setUp [
	<category: 'running'>
	e := ILRSSSourceElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'source'
    ]

    testUrl [
	<category: 'testing'>
	e url: 'foo'.
	self shouldHaveAttribute: 'url' value: 'foo'
    ]
]

