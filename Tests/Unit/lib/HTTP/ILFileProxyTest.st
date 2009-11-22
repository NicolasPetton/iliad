
TestCase subclass: ILFileProxyTest [
    | fileProxy |
    
    <comment: nil>
    <category: 'Iliad-Tests-lib-HTTP'>

    setUp [
	<category: 'running'>
	fileProxy := ILFileProxy new
    ]

    testTimestamp [
	<category: 'testing'>
	| timeStamp |
	timeStamp := DateTime now.
	fileProxy timestampsAt: #foo put: timeStamp.
	self assert: (fileProxy timestamps at: #foo) = timeStamp
    ]
]

