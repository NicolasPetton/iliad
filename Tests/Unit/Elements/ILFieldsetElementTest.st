
ILElementTest subclass: ILFieldsetElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Elements'>

    setUp [
	<category: 'running'>
	e := ILFieldsetElement new
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'fieldset'
    ]
]

