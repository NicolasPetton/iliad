"======================================================================
|
|   Iliad.Route class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
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



Object subclass: Route [
    | path stream |

    <category: 'Iliad-Core-Dispatching'>
    <comment: 'I represent a route, used to dispatch a request. 
My path is a collection of string, representing each part of the path of an url,
and can be streamed with methods in the <streaming> protocol.'>

    Route class >> delimiters [
	<category: 'accessing'>
	^Array with: $/
    ]

    Route class >> from: aString [
	<category: 'instance creation'>
	^self basicNew
	    initializeFromString: aString;
	    yourself
    ]

    initializeFromString: aString [
	<category: 'initialize-release'>
	(aString tokenize: self delimiter asString) do: [:each |
	    self path add: each].
	stream := ReadStream on: self path
    ]

    basePath [
	<category: 'accessing'>
	self path isEmpty ifTrue: [^'/'].
	^'/' , self path first
    ]

    delimiter [
	<category: 'accessing'>
	^self class delimiters first
    ]

    path [
	<category: 'accessing'>
	^path ifNil: [path := OrderedCollection new]
    ]

    currentPath [
	"Return an absolute url of the current path
	 separated with delimiters, like this:
	 /foo/bar/baz"
	<category: 'iterating'>

	| part |
	^String streamContents: [:s | 
	    1 to: stream position do: [:i | 
		part := path at: i.
		s nextPut: $/; nextPutAll: part]]
    ]

    atEnd [
	<category: 'streaming'>
	^stream atEnd
    ]

    next [
	<category: 'streaming'>
	^stream atEnd
	    ifTrue: [nil]
	    ifFalse: [stream next]
    ]

    peek [
	<category: 'streaming'>
	^stream peek
    ]

    position [
	<category: 'streaming'>
	^stream position
    ]

    position: anInteger [
	<category: 'streaming'>
	stream position: anInteger
    ]

    reset [
	<category: 'streaming'>
	stream reset
    ]

    pathString [
	<category: 'converting'>
	| str |
	str := WriteStream on: String new.
	str nextPut: $/.
	self path 
	    do: [:each | str nextPutAll: each]
	    separatedBy: [str nextPut: self delimiter].
	^str contents
    ]

    uriString [
	<category: 'converting'>
	^self pathString
    ]

    printOn: aStream [
	<category: 'printing'>
	super printOn: aStream.
	aStream 
	    nextPut: Character space;
	    nextPutAll: self uriString
    ]
]

