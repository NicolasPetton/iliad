
TestCase subclass: ILRouteTest [
    | route |

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Dispatching'>

    setUp [
	<category: 'running'>
	route := ILRoute path: (ILUrl absolute: 'hello/world/foo/bar') path
    ]

    testBasePath [
	<category: 'testing'>
	self assert: route basePath = '/hello'
    ]

    testPath [
	<category: 'testing'>
	self assert: route path asArray = #('hello' 'world' 'foo' 'bar')
    ]

    testStreaming [
	<category: 'testing'>
	| string |
	string := route next.
	self assert: string = 'hello'.
	self assert: route peek = 'world'.
	string := route next.
	self assert: string = 'world'.
	string := route next.
	self assert: string = 'foo'.
	string := route next.
	self assert: string = 'bar'.
	string := route next.
	self assert: string = nil.
	string := route next.
	self assert: string = nil.
	string := route
		    reset;
		    next.
	self assert: string = 'hello'
    ]

    testUriString [
	<category: 'testing'>
	self assert: route uriString = '/hello/world/foo/bar'
    ]
]

