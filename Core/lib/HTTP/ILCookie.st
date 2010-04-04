"======================================================================
|
|   Iliad.ILCookie class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from the WACookie class of Seaside 2.8.
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



Object subclass: ILCookie [
    | expiry key path value |
    
    <category: 'Iliad-Core-lib-HTTP'>
    <comment: 'From Seaside 2.8

I represent a cookie, a piece of information that is stored on the client 
and read and writable by the server. I am basically a key/value pair of strings.
You can never trust information in a cookie, the client is free to edit it.
I model only a part of the full cookie specification.

For more information see  RFC2965 (http://tools.ietf.org/html/rfc2965)'>

    ILCookie class >> key: keyString value: valueString [
	<category: 'instance creation'>
	^(self new)
	    key: keyString;
	    value: valueString;
	    yourself
    ]

    expiryString [
	<category: 'private'>
	self expiry ifNil: [^''].
	^(Grease.GRPrinter rfc822WithTimeZone: 'GMT') print: (DateTime fromSeconds: self expiry)
    ]

    writeOn: aStream [
	<category: 'writing'>
	aStream
	    nextPutAll: self key;
	    nextPut: $=;
	    nextPutAll: (self value ifNil: ['']).
	expiry isNil 
	    ifFalse: 
		[aStream
		    nextPutAll: '; expires=';
		    nextPutAll: self expiryString].
	path isNil 
	    ifFalse: 
		[aStream
		    nextPutAll: '; path=';
		    nextPutAll: self path]
    ]

    = other [
	<category: 'comparing'>
	^self species = other species 
	    and: [self key = other key and: [self path = other path]]
    ]

    hash [
	<category: 'comparing'>
	^self key hash bitXor: self path hash
    ]

    expireIn: aDuration [
	<category: 'api'>
	self 
	    expiry: ((DateTime fromSeconds: DateTime now asSeconds) asSeconds 
		    + aDuration asSeconds)
    ]

    valueWithExpiry [
	<category: 'api'>
	^expiry ifNil: [self value]
	    ifNotNil: [(self value ifNil: ['']) , '; expires=' , self expiryString]
    ]

    expiry [
	<category: 'accessing'>
	^expiry
    ]

    expiry: anInteger [
	<category: 'accessing'>
	expiry := anInteger
    ]

    key [
	<category: 'accessing'>
	^key
    ]

    key: aString [
	<category: 'accessing'>
	key := aString
    ]

    path [
	<category: 'accessing'>
	^path ifNil: ['/']
    ]

    path: aString [
	<category: 'accessing'>
	path := aString
    ]

    value [
	<category: 'accessing'>
	^value
    ]

    value: aString [
	<category: 'accessing'>
	value := aString
    ]
]

