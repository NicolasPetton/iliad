"======================================================================
|
|   Iliad.ILUrl class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from the WAUrl class of Seaside 2.8.
| The Seaside framework is written by Avi Bryant, Julian Fitzell, 
| Lukas Renggli, Michel Bany, Philippe Marschall and Seaside contributors 
| http://www.seaside.st 
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




Object subclass: ILUrl [
    | scheme username password hostname port path parameters fragment |
    
    <category: 'Iliad-Core-lib-HTTP'>
    <comment: 'I represent all portions of an URL as described by the RFC 1738. 
I include scheme, username, password, hostname, port, path, parameters, and fragment.
    
    Portions of this code are based on code of Kazuki Yasumatsu and Paolo Bonzini.
    
Instance Variables
scheme:			<String> or nil
username:		<String> or nil
password:		<String> or nil
hostname:		<String> or nil
port:			<Integer> or nil
path:			<OrderedCollection> or nil
parameters:		<ILSmallDictionary>
fragment:		<String> or nil'>

    ILUrl class >> absolute: aString [
	"Parse aString as an absolute URL."

	<category: 'parsing'>
	^self basicNew initializeFromString: aString
    ]

    ILUrl class >> absolute: aString relative: aRelativeString [
	"Take absolute URL aString and combine it with a relative path aRelativeString."

	<category: 'parsing'>
	^(self absolute: aString)
	    parsePath: aRelativeString;
	    yourself
    ]

    ILUrl class >> decodePercent: aString [
	"percent decodes the given String"

	<category: 'decoding'>
	| input output char |
	input := aString readStream.
	output := WriteStream on: (String new: aString size).
	[input atEnd] whileFalse: 
	    [char := input next.
	    output nextPut: (char = $+ 
		ifTrue: [Character space]
		ifFalse: [char = $% 
		    ifTrue: [
			Character value: input next asUppercase digitValue * 16 
			    + input next asUppercase digitValue]
		    ifFalse: [char]])].
	^output contents
    ]

    ILUrl class >> new [
	<category: 'instance creation'>
	^self basicNew initialize
    ]

    = anUrl [
	<category: 'comparing'>
	^self class = anUrl class and: [self printString = anUrl printString]
    ]

    hash [
	<category: 'comparing'>
	^self hostname hash bitXor: self path hash
    ]

    addAllToPath: aCollectionOfStrings [
	"convenice method to add a collection of strings to the path"

	<category: 'adding'>
	aCollectionOfStrings do: [:each | self addToPath: each]
    ]

    addParameter: aString [
	<category: 'adding'>
	self addParameter: aString value: nil
    ]

    addParameter: keyString value: valueString [
	<category: 'adding'>
	self parameters at: keyString put: valueString
    ]

    addToPath: aString [
	<category: 'adding'>
	self path addAll: (aString findTokens: '/')
    ]

    asString [
	<category: 'converting'>
	^self printString
    ]

    pathString [
	"Answer the path converted to a string."

	<category: 'converting'>
	^String streamContents: [:stream | self encodePathOn: stream]
    ]

    relativeTo: anUrl [
	"Answer a path element collection relative from the receiver to anUrl."

	<category: 'converting'>
	| currentPath argumentPath resultingPath |
	currentPath := self path copy.
	argumentPath := anUrl path copy.
	
	[currentPath notEmpty 
	    and: [argumentPath notEmpty and: [currentPath first = argumentPath first]]] 
		whileTrue: 
		    [currentPath removeFirst.
		    argumentPath removeFirst].
	resultingPath := OrderedCollection new.
	currentPath size timesRepeat: [resultingPath add: '..'].
	resultingPath addAll: argumentPath.
	^resultingPath
    ]

    decode: aString [
	"percent decodes the given String"

	<category: 'private'>
	^self class decodePercent: aString
    ]

    removeParameters [
	<category: 'private'>
	parameters := nil
    ]

    takeServerParametersFromRequest: aRequest [
	<category: 'private'>
	| httpHost |
	hostname ifNil: 
	    [httpHost := aRequest headerAt: 'host' ifAbsent: [^self].
	    hostname := httpHost copyUpTo: $:.
	    (httpHost includes: $:) 
		ifTrue: [port := (httpHost copyAfter: $:) asNumber]]
    ]

    encodeFragmentOn: aStream [
	<category: 'encoding'>
	fragment ifNil: [^self].
	aStream nextPut: $#.
	aStream nextPutAll: (ILEncoder encode: fragment)
    ]

    encodeOn: aStream [
	<category: 'encoding'>
	self encodeOn: aStream usingHtmlEntities: true
    ]

    encodeOn: aStream usingHtmlEntities: aBoolean [
	<category: 'encoding'>
	self encodeServerOn: aStream.
	self encodePathOn: aStream.
	self encodeParametersOn: aStream usingHtmlEntities: aBoolean.
	self encodeFragmentOn: aStream
    ]

    encodeParametersOn: aStream usingHtmlEntities: aBoolean [
	<category: 'encoding'>
	| first |
	first := true.
	parameters ifNil: [^self].
	parameters keysAndValuesDo: [:key :value | 
	    aStream nextPutAll: (first 
		ifTrue: [first := false. '?']
		ifFalse: [aBoolean ifTrue: ['&amp;'] ifFalse: ['&']]).
	    aStream nextPutAll: (ILEncoder encodeUrl: key).
	    value ifNotNil: 
		[aStream nextPut: $=.
		aStream nextPutAll: (ILEncoder encodeUrl: value asString)]]
    ]

    encodePathOn: aStream [
	<category: 'encoding'>
	path ifNil: [^self].
	aStream nextPut: $/.
	path do: [:each | aStream nextPutAll: (ILEncoder encodeUrl: each)]
	    separatedBy: [aStream nextPut: $/]
    ]

    encodeServerOn: aStream [
	<category: 'encoding'>
	hostname ifNil: [^self].
	aStream
	    nextPutAll: scheme;
	    nextPutAll: '://'.
	username notNil 
	    ifTrue: [
		aStream nextPutAll: (ILEncoder encodeUrl: username).
		password notNil 
		    ifTrue: [
			aStream nextPut: $:.
			aStream nextPutAll: (ILEncoder encodeUrl: password)].
		aStream nextPut: $@].
	aStream nextPutAll: (ILEncoder encodeUrl: hostname).
	port notNil 
	    ifTrue: [
		((scheme = 'http' and: [port = 80]) 
		    or: [scheme = 'https' and: [port = 443]]) 
			ifFalse: [
			    aStream
				nextPut: $:;
				print: port]]
    ]

    fragment [
	"Answer the fragment part of the URL."

	<category: 'accessing'>
	^fragment
    ]

    fragment: aString [
	<category: 'accessing'>
	fragment := aString
    ]

    hostname [
	"Answer the host part of the URL."

	<category: 'accessing'>
	^hostname
    ]

    hostname: aString [
	<category: 'accessing'>
	hostname := aString
    ]

    parameters [
	<category: 'accessing'>
	^parameters ifNil: [parameters := ILSmallDictionary new]
    ]

    password [
	"Answer the password part of the URL."

	<category: 'accessing'>
	^password
    ]

    password: aString [
	<category: 'accessing'>
	password := aString
    ]

    path [
	"Answer the path part of the URL."

	<category: 'accessing'>
	^path ifNil: [path := OrderedCollection new]
    ]

    path: aCollection [
	"Set the path part of the URL to aCollection."

	<category: 'accessing'>
	path := aCollection
    ]

    port [
	"Answer the port number part of the URL."

	<category: 'accessing'>
	^port
    ]

    port: aNumber [
	<category: 'accessing'>
	port := aNumber
    ]

    scheme [
	"Answer the URL's scheme."

	<category: 'accessing'>
	^scheme
    ]

    scheme: aString [
	"we really expect a String here, Old versions (2.7) expected a Symbol you can still pass a Symbol and get away with it but don't expect this behavior to be supported in future versions.
	 #asString is the 'correct' way to convert a Symbol to a String since #displayString will add a hash on VW"

	<category: 'accessing'>
	scheme := aString asString
    ]

    username [
	"Answer the username part of the URL."

	<category: 'accessing'>
	^username
    ]

    username: aString [
	<category: 'accessing'>
	username := aString
    ]

    initialize [
	<category: 'initialization'>
	scheme := 'http'
    ]

    initializeFromString: aString [
	<category: 'initialization'>
	| string index |
	self initialize.
	string := aString.
	index := string indexOf: $#.
	index > 0 
	    ifTrue: [
		self parseFragment: (string copyFrom: index + 1 to: string size).
		string := string copyFrom: 1 to: index - 1].
	index := string indexOf: $?.
	index > 0 
	    ifTrue: [
		self parseParameters: (string copyFrom: index + 1 to: string size).
		string := string copyFrom: 1 to: index - 1].
	index := string indexOfSubCollection: '://'.
	index > 0 
	    ifTrue: [
		self scheme: (string copyFrom: 1 to: index - 1).
		string := string copyFrom: index + 3 to: string size.
		index := string indexOf: $/.
		string := index > 0 
			    ifFalse: [self parseHost: string. '']
			    ifTrue: [
				self parseHost: (string copyFrom: 1 to: index - 1).
				string copyFrom: index + 1 to: string size]].
	self parsePath: string
    ]

    parseFragment: aString [
	<category: 'parsing'>
	aString isEmpty ifTrue: [^self].
	self fragment: (self decode: aString)
    ]

    parseHost: aString [
	<category: 'parsing'>
	| string temp index |
	aString isEmpty ifTrue: [^self].
	string := aString.
	index := string indexOf: $@.
	index > 1 
	    ifTrue: 
		[temp := string copyFrom: 1 to: index - 1.
		string := string copyFrom: index + 1 to: string size.
		index := temp indexOf: $:.
		index > 0 
		    ifFalse: [self username: (self decode: temp)]
		    ifTrue: [
			self username: (self decode: (temp copyFrom: 1 to: index - 1)).
			self password: (self decode: (temp copyFrom: index + 1 to: temp size))]].
	index := string indexOf: $:.
	index > 0 
	    ifTrue: [
		temp := string copyFrom: index + 1 to: string size.
		string := string copyFrom: 1 to: index - 1.
		self 
		    port: ((temp notEmpty and: [temp allSatisfy: [:each | each isDigit]]) 
			ifTrue: [temp asInteger])].
	self hostname: (self decode: string)
    ]

    parseParameters: aString [
	<category: 'parsing'>
	| input string index |
	input := aString readStream.
	[input atEnd] whileFalse: 
		[string := input upTo: $&.
		index := string indexOf: $=.
		index > 0 
		    ifFalse: [self addParameter: (self decode: string)]
		    ifTrue: [
			self addParameter: (self decode: (string copyFrom: 1 to: index - 1))
			    value: (self decode: (string copyFrom: index + 1 to: string size))]]
    ]

    parsePath: aString [
	<category: 'parsing'>
	| input part |
	input := aString readStream.
	input peek = $/ ifTrue: [path := nil].
	[input atEnd] whileFalse: [
	    part := input upTo: $/.
		part isEmpty ifFalse: [
		    part = '..' 
			ifTrue: [self path isEmpty ifFalse: [self path removeLast]]
			ifFalse: [part = '.' ifFalse: [self path addLast: (self decode: part)]]]]
    ]

    postCopy [
	<category: 'copying'>
	super postCopy.
	scheme := scheme copy.
	username := username copy.
	password := password copy.
	hostname := hostname copy.
	port := port copy.
	path := path copy.
	parameters := parameters copy.
	fragment := fragment copy
    ]

    with: pathString [
	<category: 'copying'>
	^self copy
	    addToPath: pathString;
	    yourself
    ]

    withParameter: aString [
	<category: 'copying'>
	^self copy
	    addParameter: aString;
	    yourself
    ]

    withParameter: aString value: valueString [
	<category: 'copying'>
	^self copy
	    addParameter: aString value: valueString;
	    yourself
    ]

    withoutParameters [
	<category: 'copying'>
	^self copy
	    removeParameters;
	    yourself
    ]

    printOn: aStream [
	<category: 'printing'>
	self encodeOn: aStream usingHtmlEntities: false
    ]
]

