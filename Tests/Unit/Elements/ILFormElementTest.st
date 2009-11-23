
ILElementTest subclass: ILFormElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILFormElement new
    ]

    testAccept [
	<category: 'testing'>
	e accept: 'foo'.
	self assert: (e attributeAt: 'accept') = 'foo'
    ]

    testAcceptCharset [
	<category: 'testing'>
	e acceptCharset: 'utf-8'.
	self assert: (e attributeAt: 'accept-charset') = 'utf-8'
    ]

    testAcceptCharsets [
	<category: 'testing'>
	| charsets |
	charsets := #('utf-8' 'foo' 'bar').
	e acceptCharsets: charsets.
	self assert: (e attributeAt: 'accept-charset') = 'utf-8 foo bar'
    ]

    testAccepts [
	<category: 'testing'>
	| accepts |
	accepts := #('foo' 'bar').
	e accepts: accepts.
	self assert: (e attributeAt: 'accept') = 'foo bar'
    ]

    testBeMultipart [
	<category: 'testing'>
	e beMultipart.
	self assert: (e attributeAt: 'enctype') = 'multipart/form-data'.
	self assert: e isMultipart
    ]

    testEncodingType [
	<category: 'testing'>
	e enctype: 'foo'.
	self assert: (e attributeAt: 'enctype') = 'foo'.
	self assert: (e class encodingType = 'application/x-www-form-urlencoded')
    ]

    testMultipart [
	<category: 'testing'>
	e multipart: true.
	self assert: (e attributeAt: 'enctype') = 'multipart/form-data'
    ]

    testReset [
	<category: 'testing'>
	e onResest: 'foo'.
	self assert: (e attributeAt: 'onreset') = 'foo'
    ]

    testSubmit [
	<category: 'testing'>
	e onSubmit: 'foo'.
	self assert: (e attributeAt: 'onsubmit') = 'foo'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'form'
    ]

    testUseGet [
	<category: 'testing'>
	e useGet.
	self assert: (e attributeAt: 'method') = 'get'
    ]

    testUsePost [
	<category: 'testing'>
	e usePost.
	self assert: (e attributeAt: 'method') = 'post'
    ]
]

