TestCase subclass: ModelProxyTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Utilities'>

    test [
	<category: 'testing'>
	| cookie proxy |
	cookie := Cookie new.
	cookie key: 'The Metaphor'.
	proxy := ModelProxy on: cookie.
	self assert: proxy key = cookie key.
	self assert: cookie expiry isNil.
	self assert: proxy expiry = cookie expiry.
	proxy expiry: (DateTime fromSeconds: 36209).
	self assert: proxy expiry = (DateTime fromSeconds: 36209).
	self assert: cookie expiry isNil.
	proxy commit.
	self assert: cookie expiry = (DateTime fromSeconds: 36209)
    ]
]

