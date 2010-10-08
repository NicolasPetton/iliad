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

    | request router session urlBuilder previousStateRegistry stateRegistry builtWidgets attributes |
    <category: 'Iliad-Core-Sessions'>
    <comment: 'I store current request context objects:
- the router
- the session
- the request itself

A can be accessed through ILObject>>context'>

    router [
	<category: 'accessing'>
	^router ifNil: [router := ILRouter new]
    ]

    application [
	<category: 'accessing'>
	^self router application
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
   
    stateRegistry [
	<category: 'accessing'>
	^stateRegistry ifNil: [
	    stateRegistry := (self session stateRegistryAt: self request stateField) 
		ifNil: [self session newStateRegistry]]
    ]

    previousStateRegistry [
	<category: 'accessing'>
	^previousStateRegistry ifNil: [
	    previousStateRegistry := (self session stateRegistryAt: self request stateField) copy]
    ]

    builtWidgets [
	<category: 'accessing'>
	^builtWidgets ifNil: [builtWidgets := OrderedCollection new]
    ]

    attributes [
	<category: 'accessing'>
	^attributes ifNil: [attributes := Dictionary new]
    ]

    attributeAt: aKey [
	<category: 'accessing-attributes'>
	^self attributes at: aKey ifAbsent: [nil]
    ]

    attributeAt: aKey put: anObject [
	<category: 'accessing-attributes'>
	self attributes at: aKey put: anObject
    ]

    addBuiltWidget: aWidget [
	<category: 'adding'>
	self builtWidgets add: aWidget
    ]
]

