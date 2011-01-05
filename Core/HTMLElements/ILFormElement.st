"======================================================================
|
|   Iliad.ILFormElement class definition
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



ILHTMLBuilderElement subclass: ILFormElement [

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    ILFormElement class >> encodingType [
	<category: 'defaults'>
	^'application/x-www-form-urlencoded'
    ]

    ILFormElement class >> multipartFormData [
	<category: 'defaults'>
	^'multipart/form-data'
    ]

    tag [
	<category: 'accessing'>
	^'form'
    ]

    url [
	<category: 'accessing'>
	^self context baseUrl greaseString
    ]

    accept: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'accept' put: aString
    ]

    acceptCharset: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'accept-charset' put: aString
    ]

    acceptCharsets: aCollection [
	<category: 'accessing attributes'>
	| encodings |
	encodings := WriteStream on: String new.
	aCollection do: [:each | encodings nextPutAll: each]
	    separatedBy: [encodings nextPutAll: ' '].
	self acceptCharset: encodings contents
    ]

    accepts: aCollection [
	<category: 'accessing attributes'>
	| contentTypes |
	contentTypes := WriteStream on: String new.
	aCollection do: [:each | contentTypes nextPutAll: each]
	    separatedBy: [contentTypes nextPutAll: ' '].
	self accept: contentTypes contents
    ]

    beMultipart [
	<category: 'accessing attributes'>
	self enctype: self class multipartFormData
    ]

    enctype [
	<category: 'accessing attributes'>
	^self attributeAt: 'enctype'
    ]

    enctype: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'enctype' put: aString
    ]

    multipart: aBoolean [
	<category: 'accessing attributes'>
	aBoolean ifTrue:
	    [self beMultipart]
    ]

    useGet [
	<category: 'accessing attributes'>
	self attributeAt: 'method' put: 'get'
    ]

    usePost [
	<category: 'accessing attributes'>
	self attributeAt: 'method' put: 'post'
    ]

    onReset: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'reset' add: aString
    ]

    onSubmit: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'submit' add: aString
    ]

    onResetDo: aBlock [
	<category: 'accessing attributes-events'>
	self onEvent: 'reset' do: aBlock
    ]

    onSubmitDo: aBlock [
	<category: 'accessing attributes-events'>
	self onEvent: 'submit' do: aBlock
    ]

    beforePrintHtml [
	<category: 'printing'>
	self attributeAt: 'action' ifAbsentPut: [self context baseUrl greaseString].
	self attributeAt: 'method' ifAbsent: [self usePost].
	self attributeAt: 'accept-charset' ifAbsentPut: [self session charset].
	self addHiddenParameters
    ]

    isMultipart [
	<category: 'testing'>
	^self enctype = self class multipartFormData
    ]

    addHiddenParameters [
	<category: 'private'>
	self context urlBuilder baseUrl parameters keysAndValuesDo: [:key :value |
	    self input
		beHidden;
		name: key;
		value: value].
	self input
	    beHidden;
	    name: self context urlBuilder stateKey;
	    value: self session stateRegistry key.
	self isMultipart ifTrue: [
	    self input
		beHidden;
		name: '_callback';
		value: (self context urlBuilder urlForAction: (self session registerActionFor: [])) greaseString]
    ]
]

