
ILElementTest subclass: ILRSSCommentsElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RSS'>

    testTag [
	<category: 'testing'>
	self assert: e tag = 'comments'
    ]

    setUp [
	<category: 'running'>
	e := ILRSSCommentsElement new
    ]
]

