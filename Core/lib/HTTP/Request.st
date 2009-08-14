"======================================================================
|
|   Iliad.Request class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from the WARequest class of Seaside 2.8.
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



Object subclass: Request [
    | url fields headers cookies method nativeRequest |
    <category: 'Iliad-Core-lib-HTTP'>
    <comment: 'From Seaside 2.8.

I am a server independent http request object.'>

    Request class >> new [
	<category: 'instance creation'>
	^self basicNew
	    initialize;
	    yourself
    ]

    initialize [
	<category: 'initialize-release'>
	headers := Dictionary new.
	fields := Dictionary new.
	cookies := Dictionary new
    ]

    at: key [
	<category: 'accessing'>
	^fields at: key
    ]

    at: key ifAbsent: aBlock [
	<category: 'accessing'>
	^fields at: key ifAbsent: aBlock
    ]

    cookies [
	<category: 'accessing'>
	^cookies
    ]

    cookies: anObject [
	<category: 'accessing'>
	cookies := anObject
    ]

    fields [
	<category: 'accessing'>
	^fields
    ]

    fields: anObject [
	<category: 'accessing'>
	fields := anObject
    ]

    hashLocationField [
	<category: 'accessing'>
	^self
	    at: UrlBuilder default hashKey
	    ifAbsent: [nil]
    ]

    sessionField [
	<category: 'accessing'>
	^self 
	    at: UrlBuilder default sessionKey
	    ifAbsent: [nil]
    ]

    tokenField [
	<category: 'accessing'>
	^self
	    at: UrlBuilder default tokenKey
	    ifAbsent: [nil]
    ]

    actionField [
	<category: 'accessing'>
	^self 
	    at: UrlBuilder default actionKey
	    ifAbsent: [nil]
    ]

    headerAt: aKey [
	<category: 'accessing'>
	^self headerAt: aKey ifAbsent: []
    ]

    headerAt: aKey ifAbsent: aBlock [
	<category: 'accessing'>
	^headers at: aKey ifAbsent: aBlock
    ]

    headers [
	<category: 'accessing'>
	^headers
    ]

    headers: aDictionary [
	<category: 'accessing'>
	headers := aDictionary
    ]

    method [
	<category: 'accessing'>
	^method
    ]

    method: aString [
	<category: 'accessing'>
	method := aString
    ]

    nativeRequest [
	<category: 'accessing'>
	^nativeRequest
    ]

    nativeRequest: aRequest [
	<category: 'accessing'>
	nativeRequest := aRequest
    ]

    password [
	<category: 'accessing'>
	^self authorization ifNotNilDo: [:auth | auth copyAfter: $:]
    ]

    url [
	<category: 'accessing'>
	^url
    ]

    url: anUrl [
	<category: 'accessing'>
	url := anUrl
    ]

    user [
	<category: 'accessing'>
	^self authorization ifNotNilDo: [:auth | auth copyUpTo: $:]
    ]

    hasCookies [
	<category: 'testing'>
	^self cookies notNil and: [self cookies notEmpty]
    ]    

    isAjaxRequest [
	<category: 'testing'>
	^(self headerAt: 'x-requested-with') = 'XMLHttpRequest'
    ]

    isGet [
	<category: 'testing'>
	^self method asUppercase = 'GET'
    ]

    isPost [
	<category: 'testing'>
	^self method asUppercase = 'POST'
    ]

    isPrefetch [
	<category: 'testing'>
	^(self headerAt: 'HTTP_X_MOZ') = 'prefetch'
    ]

    isPut [
	<category: 'testing'>
	^self method asUppercase = 'PUT'
    ]

    isTypeOfRequestForRedirect [
	<category: 'testing'>
	^self isPost not and: [
	    self actionField notNil]
    ]

    isTypeOfRequestForJson [
	<category: 'testing'>
	^(self headerAt: 'accept' ifAbsent: ['']) matchRegex: '.*application/json.*'
    ]

    authorization [
	<category: 'private'>
	^(self headerAt: 'Authorization' ifAbsent: [self headerAt: 'authorization']) 
	    ifNotNilDo: [:auth | self decodeAuthorization: auth]
    ]

    decodeAuthorization: aString [
	<category: 'private'>
	^Support base64Decode: (aString tokenize: ' ') last
    ]

    setMethod: methodString url: urlString headers: headDict fields: fieldDict cookies: cookieDict [
	<category: 'private'>
	method := methodString.
	url := urlString.
	headers := headDict.
	fields := fieldDict.
	cookies := cookieDict
    ]
]

