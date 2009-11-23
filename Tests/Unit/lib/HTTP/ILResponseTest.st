
TestCase subclass: ILResponseTest [
    | response |
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-lib-HTTP'>

    setUp [
	<category: 'running'>
	response := ILResponse new
    ]

    testAuthenticationFailed [
	<category: 'testing'>
	response authenticationFailed.
	self assert: response status = 401
    ]

    testForbidden [
	<category: 'testing'>
	response forbidden.
	self assert: response status = 403
    ]

    testInternalError [
	<category: 'testing'>
	response internalError.
	self assert: response status = 500
    ]

    testNotFound [
	<category: 'testing'>
	response notFound.
	self assert: response status = 404
    ]

    testOk [
	<category: 'testing'>
	response ok.
	self assert: response status = 200
    ]

    testRedirect [
	<category: 'testing'>
	response redirect.
	self assert: response status = 302
    ]
]

