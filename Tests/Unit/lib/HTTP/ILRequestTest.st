TestCase subclass: ILRequestTest [
    | request |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-lib-HTTP'>

    setUp [
	<category: 'running'>
	request := ILRequest new
    ]

    testIsGet [
	<category: 'testing'>
	request method: 'get'.
	self assert: (request isGet = true)
    ]

    testIsPost [
	<category: 'testing'>
	request method: 'post'.
	self assert: (request isPost = true)
    ]

    testIsPut [
	<category: 'testing'>
	request method: 'put'.
	self assert: (request isPut = true)
    ]
]

