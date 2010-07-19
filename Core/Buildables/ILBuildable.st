"======================================================================
|
|   Iliad.ILBuildable class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Some parts of this file reuse code from the Seaside framework written 
| by Avi Bryant, Julian Fitzell, Lukas Renggli, Michel Bany, Philippe
| Marschall and Seaside contributors http://www.seaside.st 
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



ILObject subclass: ILBuildable [
    | attributes |
    
    <category: 'Iliad-Core-Buildables'>
    <comment: 'I am an abstract buildable object. 
My subclasses must override #build method, which should return an instance of a subclass of Iliad.ILElement.'>

    attributeAt: aSymbol [
	<category: 'accessing attributes'>
	^self attributes at: aSymbol ifAbsent: [nil]
    ]

    attributeAt: aSymbol ifAbsentPut: aBlock [
	<category: 'accessing attributes'>
	^self attributes at: aSymbol ifAbsentPut: aBlock
    ]

    attributeAt: aSymbol put: anObject [
	<category: 'accessing attributes'>
	^self attributes at: aSymbol put: anObject
    ]

    attributes [
	<category: 'accessing attributes'>
	^attributes ifNil: [attributes := Dictionary new]
    ]

    build [
	"Override this method in subclasses.
	It must answer an Element"
	<category: 'building'>

	self subclassResponsibility
    ]

    buildOn: anElement [
	<category: 'building'>
	anElement add: self build
    ]

    redirectTo: anUrlString [
	"Abort all other request handling.
	 Redirect to anUrlString"
	<category: 'redirecting'>

	self session
	    redirectUrl: anUrlString;
	    redirect
    ]

    redirectToIndex [
	"Abort all other request handling.
	 Redirect to the index method of this class"
	<category: 'redirecting'>

	self redirectToLocal: 'index'
    ]

    redirectToLocal: aString [
	"Abort all other request handling.
	 Make a redirection to another controller method in this application"
	<category: 'redirecting'>

	self 
	    redirectToApplication: self application class 
	    controller: aString
    ]

    redirectToApplication: aClass [
	"Abort all other request handling.
	Redirect to the index method of <aClass>"
	<category: 'redirecting'>

	self redirectToApplication: aClass controller: ''
    ]

    redirectToApplication: aClass controller: aString [
	"Abort all other request handling.
	Redirect to the controller named <aString> of <aClass>"
	<category: 'redirecting'>

	self redirectTo: 
	    (self context urlBuilder urlFor: aClass path, '/', aString) 
		greaseString
    ]

    redirectToCurrentController [
	"Abort all other request handling.
	Redirect to the current controller method"
	<category: 'redirecting'>
	self redirectTo: self application route pathString
    ]

    respondOn: aResponse [
	<category: 'converting'>
	self build respondOn: aResponse
    ]
]
