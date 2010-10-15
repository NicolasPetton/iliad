
TestCase subclass: ILSessionTest [
    | session |

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Sessions'>

    setUp [
	<category: 'running'>
	session := ILSession new.
	ILApplicationMock1 path: 'test'.
	ILApplicationMock2 path: 'test/foo'
    ]

    tearDown [
	<category: 'running'>
	ILApplicationMock1 path: nil.
	ILApplicationMock2 path: nil
    ]

    testExpire [
	<category: 'testing'>
	| s |
	s := ILSession new.
	self deny: s isExpired.
	s expire.
	self assert: s isExpired.
	s := ILSession new.
	s expirySeconds: 1.
	self deny: s isExpired.
	(Delay forSeconds: 2) wait.
	self assert: s isExpired
    ]

    testCharset [
	<category: 'testing'>
	session charset: 'foo'.
	self assert: (session charset = 'foo')
    ]

    testRefreshOnBacktrack [
	<category: 'testing'>
	session refreshOnBacktrack: true.
	self assert: (session refreshOnBacktrack = true)
    ]

    testUseCookies [
	<category: 'testing'>
	session useCookies: true.
	self assert: (session useCookies = true)
    ]
]
