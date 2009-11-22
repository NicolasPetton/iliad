
ILElementTest subclass: ILRSSCloudElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RSS'>

    setUp [
	<category: 'running'>
	e := ILRSSCloudElement new
    ]

    testTag [
	<category: 'running'>
	self assert: e tag = 'cloud'
    ]

    testDomain [
	<category: 'testing'>
	e domain: 'foo'.
	self shouldHaveAttribute: 'domain' value: 'foo'
    ]

    testPath [
	<category: 'testing'>
	e path: 'foo'.
	self shouldHaveAttribute: 'path' value: 'foo'
    ]

    testPort [
	<category: 'testing'>
	e port: 9999.
	self shouldHaveAttribute: 'port' value: '9999'
    ]

    testProtocol [
	<category: 'testing'>
	e protocol: 'ssh'.
	self shouldHaveAttribute: 'protocol' value: 'ssh'
    ]

    testRegisterProcedure [
	<category: 'testing'>
	e registerProcedure: 'Namespace.Object'.
	self shouldHaveAttribute: 'registerProcedure' value: 'Namespace.Object'
    ]
]

