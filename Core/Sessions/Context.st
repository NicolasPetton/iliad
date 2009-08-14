"======================================================================
|
|   Iliad.Context class definition
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



Object subclass: Context [

    | request application route session hashRoute |
    <category: 'Iliad-Core-Sessions'>
    <comment: 'I store current request context objects:
- the route
- the session
- the application
- the request itself

A can be accessed through IliadObject>>context'>

    Context class >> new [
    <category: 'instance creation'>
    ^self basicNew
	initialize;
	yourself
    ]

    initialize [
	<category: 'initialize-release'>
    ]

    application [
	<category: 'accessing'>
	^application
    ]

    application: anApplication [
	<category: 'accessing'>
	application := anApplication
    ]

    hashRoute [
	<category: 'accessing'>
	hash := self request hashLocationField ifNil: [''].
	^hashRoute ifNil: [hashRoute := Route from: hash]
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
	^route ifNil: [route := Route from: self request url pathString]
    ]
]

