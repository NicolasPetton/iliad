"======================================================================
|
|   Iliad.Response class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from the WAResponse class of Seaside 2.8.
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



Object subclass: Response [
    | contentType headers cookies status stream |
    <category: 'Iliad-Core--lib-HTTP'>
    <comment: 'From Seaside 2.8

I am a server independent http response object.'>

    Response class >> new [
	<category: 'instance creation'>
	^self basicNew 
	    initialize;
	    yourself
    ]

    Response class >> forbidden [
	<category: 'instance creation'>
	^self new forbidden
    ]

    Response class >> notFound [
	<category: 'instance creation'>
	^self new notFound
    ]

    Response class >> ok [
	<category: 'instance creation'>
	^self new ok
    ]

    Response class >> redirect [
	<category: 'instance creation'>
	^self new redirect
    ]

    addCookie: aCookie [
	<category: 'accessing'>
	cookies ifNil: [cookies := Set new].
	cookies add: aCookie
    ]

    contentType [
	<category: 'accessing'>
	^contentType
    ]

    contentType: mimeTypeString [
	<category: 'accessing'>
	contentType := mimeTypeString
    ]

    contents [
	<category: 'accessing'>
	^stream contents
    ]

    contents: aStream [
	<category: 'accessing'>
	stream := aStream
    ]

    cookieAt: key put: value [
	<category: 'accessing'>
	^self addCookie: (Cookie key: key value: value)
    ]

    cookies [
	<category: 'accessing'>
	^cookies ifNil: [#()]
    ]

    headerAt: key put: value [
	<category: 'accessing'>
	headers ifNil: [headers := OrderedCollection new].
	headers add: (Association key: key value: value)
    ]

    headers [
	<category: 'accessing'>
	^headers ifNil: [#()]
    ]

    initialize [
	<category: 'accessing'>
	stream := WriteStream on: String new.
	status := '200'.
	contentType := 'text/html; charset=utf-8'
    ]

    nextPut: aCharacter [
	<category: 'streaming'>
	stream nextPut: aCharacter asCharacter
    ]

    nextPutAll: aString [
	<category: 'streaming'>
	aString do: [:ea | self nextPut: ea]
    ]

    space [
	<category: 'streaming'>
	stream space
    ]

    release [
	<category: 'accessing'>
	stream := cookies := headers := nil
    ]

    status [
	<category: 'accessing'>
	^status
    ]

    status: anInteger [
	<category: 'accessing'>
	status := anInteger
    ]

    stream [
	<category: 'accessing'>
	^stream
    ]

    stream: aStream [
	<category: 'accessing'>
	stream := aStream
    ]

    attachmentWithFileName: aString [
	<category: 'convenience'>
	self headerAt: 'Content-dispostion'
	    put: 'attachment; filename="' , aString , '"'
    ]

    basicAuthenticationRealm: aString [
	<category: 'convenience'>
	self headerAt: 'WWW-Authenticate' put: 'Basic realm="' , aString , '"'.
	self authenticationFailed
    ]

    redirectTo: aString [
	<category: 'convenience'>
	self headerAt: 'Location' put: aString.
	self redirect
    ]

    authenticationFailed [
	<category: 'status'>
	self status: 401
    ]

    forbidden [
	<category: 'status'>
	self status: 403
    ]

    internalError [
	<category: 'status'>
	self status: 500
    ]

    notFound [
	<category: 'status'>
	self status: 404
    ]

    ok [
	<category: 'status'>
	self status: 200
    ]

    redirect [
	<category: 'status'>
	self status: 302
    ]

    printOn: aStream [
	<category: 'printing'>
	super printOn: aStream.
	aStream space; nextPutAll: self status printString
    ]
]

