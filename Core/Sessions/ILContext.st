"======================================================================
|
|   Iliad.ILContext class definition
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



ILObject subclass: ILContext [

    | request application route hashRoute session urlBuilder stateRegistry |
    <category: 'Iliad-Core-Sessions'>
    <comment: 'I store current request context objects:
- the route
- the session
- the application
- the request itself

A can be accessed through ILObject>>context'>

    application [
	<category: 'accessing'>
	^application
    ]

    application: anApplication [
	<category: 'accessing'>
	application := anApplication
    ]

    urlBuilder [
	<category: 'accessing'>
	^urlBuilder ifNil: [urlBuilder := ILUrlBuilder new]
    ]

    baseUrl [
	<category: 'accessing'>
	^self urlBuilder baseUrl
    ]

    request [
	<category: 'accessing'>
	^request
    ]

    request: aRequest [
	<category: 'accessing'>
	request := aRequest
    ]

    session [
	<category: 'accessing'>
	^session
    ]

    session: aSession [
	<category: 'accessing'>
	session := aSession
    ]

    route [
	<category: 'accessing'>
	^route ifNil: [route := ILRoute path: self request url path]
    ]
    
    hashRoute [
	<category: 'accessing'>
	| hash |
	hash := self request hashLocationField ifNil: [''].
	^hashRoute ifNil: [hashRoute := ILRoute path: (hash tokenize: '/')]
    ]

    stateRegistry [
	<category: 'accessing'>
	^stateRegistry ifNil: [stateRegistry := self session newStateRegistry]
    ]

    previousStateRegistry [
	<category: 'accessing'>
	^self session stateRegistryAt: self request stateField
    ]
]

