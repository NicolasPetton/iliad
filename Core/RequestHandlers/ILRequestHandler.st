"======================================================================
|
|   Iliad.ILRequestHandler class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
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



ILObject subclass: ILRequestHandler [
    <category: 'Iliad-Core-RequestHandlers'>
    <comment: 'I implement the basic behavior needed to handle requests.

My sublcasses must override #newResponse to handle requests, and most likely #produceResponse.
The current handled request is answered by the #request method inherited from ILObject'>

    handleRequest [
	<category: 'request handling'>
	self produceResponse
    ]
    
    produceResponse [
	<category: 'responding'>
	self respond: [:response | ]
    ]

    respond: aBlock [
	<category: 'private'>
	| response |
	response := self newResponse.
	aBlock value: response.
	self returnResponse: response
    ]

    returnResponse: aResponse [
	<category: 'private'>
	ILResponseNotification new
	    response: aResponse;
	    signal
    ]

    newResponse [
	<category: 'private'>
	self subclassResponsibility
    ]

    addCacheHeaderTo: aResponse [
	<category: 'private'>
	aResponse 
	    headerAt: 'expires' 
	    put: (ILSupport rfc1123StringFor: (DateTime fromSeconds: DateTime now asSeconds + (24*3600)))
    ]

    addAllowHeaderTo: aResponse [
	<category: 'private'>
	| methods |
	methods := 'OPTIONS,GET,HEAD,POST,DELETE,TRACE,PROPFIND,PROPPATCH,MKCOL,PUT,COPY,MOVE,LOCK,UNLOCK'.
	aResponse headerAt: 'Allow' put: methods
    ]

    addCookieHeaderTo: aResponse [
	<category: 'private'>
	aResponse 
	    addCookie: (ILCookie new 
		key: self session sessionManager cookieName; 
		value: self session id; 
		expireIn: (Duration days: 600);
		yourself)
    ]

    addNoCacheHeaderTo: aResponse [
	aResponse headerAt: 'expires' put: (ILSupport rfc1123StringFor: DateTime now).
	aResponse headerAt: 'Cache-Control' put: 'no-store, no-cache, must-revalidate'
    ]
]
