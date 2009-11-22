
TestCase subclass: ILJsonTest [

    <category: 'Iliad-Core-lib-JSON'>
    <comment: 'I provide a number of test cases for class Json.'>

    json: aString equals: aValue [
	| readValue |
	readValue := self readFrom: aString.
	self assert: readValue = aValue.
    ]

    readFrom: aString [
	<category: 'filein/out'>
	^(ILJson newWithConstructors: {ILJsonDummyTestObject.}) readFrom: aString readStream
    ]

    render: anObject equals: aString [
	self assert: (ILJson render: anObject) = aString
    ]

    simpleDummyObject [
	^ILJsonDummyTestObject new a: 1; b: 2; c: 3; yourself
    ]

    testArray [
	<category: 'tests'>
	self json: '[]' equals: #().
	self json: '[[]]' equals: #(#()).
	self json: '[[], []]' equals: #(#() #()).
	self json: '["hi", "there"]' equals: #('hi' 'there').
	self json: '[["a", "b", null]]' equals: #(('a' 'b' nil)).
    ]

    testAtomFalse [
	<category: 'tests'>
	self json: 'false' equals: false.
	self json: '  false' equals: false.
	self json: 'false  ' equals: false.
	self json: '  false  ' equals: false.
    ]

    testAtomNull [
	<category: 'tests'>
	self json: 'null' equals: nil.
	self json: '  null' equals: nil.
	self json: 'null  ' equals: nil.
	self json: '  null  ' equals: nil.
    ]

    testAtomNumber [
        <category: 'tests'>	
	self json: '1' equals: 1.
	self json: '0123' equals: 123.
	self json: '1.23e2' equals: 123.
	self json: '-1' equals: -1.
	self json: '-0' equals: 0.
	self json: '[-1.2]' equals: #(-1.2).
    ]

    testAtomString [
	<category: 'tests'>
	self json: '"hi"' equals: 'hi'.
	self json: '"\""' equals: '"'.
	self json: '"\\"' equals: '\'.
	self json: '""' equals: ''.
    ]

    testAtomTrue [
	<category: 'tests'>
	self json: 'true' equals: true.
	self json: '  true' equals: true.
	self json: 'true  ' equals: true.
	self json: '  true  ' equals: true.
    ]

    testCtor [
	<category: 'tests'>
	self json: '@ILJsonDummyTestObject {"a": 1, "b": 2, "c": 3}' equals: self simpleDummyObject.
	self json: (ILJson render: self simpleDummyObject) equals: self simpleDummyObject.
    ]

    
    testDictionary [
	<category: 'tests'>
	self json: '{}' equals: (Dictionary new).
	self json: '{"a": "a"}' equals: (Dictionary new at: 'a' put: 'a'; yourself).
	self json: '{"a": [[]]}' equals: (Dictionary new at: 'a' put: #(#()); yourself).
	self json: '{"a":"b", "b":"a"}' equals: (Dictionary from: {'a'->'b'. 'b'->'a'}).
    ]

    testMissingCtor [
	<category: 'tests'>
	self 
		should: [self readFrom: '@Missing[]']
		raise: ILJsonSyntaxError
    ]

    
    testMissingCtorNoMap [
	<category: 'tests'>
	self 
		should: [ILJson new readFrom: '@Missing[]' readStream]
		raise: ILJsonSyntaxError
    ]

    testWriteString [
	<category: 'tests'>
	self render: '"' equals: '"\""'.
	self render: '\' equals: '"\\"'.
	self render: 'hi' equals: '"hi"'.
	self render: ({$a. Character lf. $b} asString) equals: '"a\nb"'.
    ]
]
