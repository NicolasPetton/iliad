"======================================================================
|
|   Iliad.ILJsonTest class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from Displomacy written by Avi Bryant
| http://www.squeaksource.com/Diplomacy.
|
| This file is part of the Iliad framework.
|
| Permission is hereby granted, free of charge, to any person obtaining
| a copy of this software and associated documentation files (the 
| 'Software'), to deal in the Software without restriction, including 
| without limitation the rights to use, copy, modify, merge, publish, 
| distribute, sublicense, and/or sell copies of the Software, and to 
| permit persons to whom the Software is furnished to do so, subject to 
| the following conditions:
|
| The above copyright notice and this permission notice shall be 
| included in all copies or substantial portions of the Software.
|
| THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, 
| EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
| MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
| IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
| CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
| TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
| SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  
|
 ======================================================================"


TestCase subclass: ILJsonTest [

    <category: 'Iliad-Tests-Unit-lib-JSON'>
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
	<category: 'testing'>
	self json: '[]' equals: #().
	self json: '[[]]' equals: #(#()).
	self json: '[[], []]' equals: #(#() #()).
	self json: '["hi", "there"]' equals: #('hi' 'there').
	self json: '[["a", "b", null]]' equals: #(('a' 'b' nil)).
    ]

    testAtomFalse [
	<category: 'testing'>
	self json: 'false' equals: false.
	self json: '  false' equals: false.
	self json: 'false  ' equals: false.
	self json: '  false  ' equals: false.
    ]

    testAtomNull [
	<category: 'testing'>
	self json: 'null' equals: nil.
	self json: '  null' equals: nil.
	self json: 'null  ' equals: nil.
	self json: '  null  ' equals: nil.
    ]

    testAtomNumber [
        <category: 'testing'>	
	self json: '1' equals: 1.
	self json: '0123' equals: 123.
	self json: '1.23e2' equals: 123.
	self json: '-1' equals: -1.
	self json: '-0' equals: 0.
	self json: '[-1.2]' equals: #(-1.2).
    ]

    testAtomString [
	<category: 'testing'>
	self json: '"hi"' equals: 'hi'.
	self json: '"\""' equals: '"'.
	self json: '"\\"' equals: '\'.
	self json: '""' equals: ''.
    ]

    testAtomTrue [
	<category: 'testing'>
	self json: 'true' equals: true.
	self json: '  true' equals: true.
	self json: 'true  ' equals: true.
	self json: '  true  ' equals: true.
    ]

    testCtor [
	<category: 'testing'>
	self json: '@ILJsonDummyTestObject {"a": 1, "b": 2, "c": 3}' equals: self simpleDummyObject.
	self json: (ILJson render: self simpleDummyObject) equals: self simpleDummyObject.
    ]

    
    testDictionary [
	<category: 'testing'>
	self json: '{}' equals: (Dictionary new).
	self json: '{"a": "a"}' equals: (Dictionary new at: 'a' put: 'a'; yourself).
	self json: '{"a": [[]]}' equals: (Dictionary new at: 'a' put: #(#()); yourself).
	self json: '{"a":"b", "b":"a"}' equals: (Dictionary from: {'a'->'b'. 'b'->'a'}).
    ]

    testMissingCtor [
	<category: 'testing'>
	self 
		should: [self readFrom: '@Missing[]']
		raise: ILJsonSyntaxError
    ]

    testMissingCtorNoMap [
	<category: 'testing'>
	self 
	    should: [ILJson new readFrom: '@Missing[]' readStream]
	    raise: ILJsonSyntaxError
    ]

    testWriteString [
	<category: 'testing'>
	self render: '"' equals: '"\""'.
	self render: '\' equals: '"\\"'.
	self render: 'hi' equals: '"hi"'.
	self render: ({$a. Character lf. $b} greaseString) equals: '"a\nb"'.
    ]
]
