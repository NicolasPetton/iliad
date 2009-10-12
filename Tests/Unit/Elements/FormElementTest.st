ElementTest subclass: FormElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := FormElement new
    ]

    testAccept [
	<category: 'tests'>
	e accept: 'foo'.
	self assert: (e attributeAt: 'accept') = 'foo'
    ]

    testAcceptCharset [
	<category: 'tests'>
	e acceptCharset: 'utf-8'.
	self assert: (e attributeAt: 'accept-charset') = 'utf-8'
    ]

    testAcceptCharsets [
	<category: 'tests'>
	| charsets |
	charsets := #('utf-8' 'foo' 'bar').
	e acceptCharsets: charsets.
	self assert: (e attributeAt: 'accept-charset') = 'utf-8 foo bar'
    ]

    testAccepts [
	<category: 'tests'>
	| accepts |
	accepts := #('foo' 'bar').
	e accepts: accepts.
	self assert: (e attributeAt: 'accept') = 'foo bar'
    ]

    testBeMultipart [
	<category: 'tests'>
	e beMultipart.
	self assert: (e attributeAt: 'enctype') = 'multipart/form-data'.
	self assert: e isMultipart
    ]

    testEncodingType [
	<category: 'tests'>
	e enctype: 'foo'.
	self assert: (e attributeAt: 'enctype') = 'foo'
    ]

    testMultipart [
	<category: 'tests'>
	e multipart: true.
	self assert: (e attributeAt: 'enctype') = 'multipart/form-data'
    ]

    testTag [
	<category: 'testing'>
	self assert: e tag = 'form'
    ]

    testUseGet [
	<category: 'tests'>
	e useGet.
	self assert: (e attributeAt: 'method') = 'get'
    ]

    testUsePost [
	<category: 'tests'>
	e usePost.
	self assert: (e attributeAt: 'method') = 'post'
    ]
]

