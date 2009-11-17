"======================================================================
|
|   Iliad.Element class definition
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



Composite subclass: Element [
    | attributes |
    
    <category: 'Iliad-Core-Elements'>
    <comment: 'I am the abstract root class of the composite element hierarchy.

I know how to print myself in HTML format with the #printHtmlOn: method'>


    = anObject [
	<category: 'comparing'>
	^super = anObject and: [
	    self attributes = anObject attributes]
    ]

    hash [
	<category: 'comparing'>
	^super hash bitXor: self attributes hash
    ]

    attributes [
	<category: 'accessing'>
	^attributes ifNil: [attributes := SmallDictionary new]
    ]

    attributeAt: akey [
	<category: 'accessing'>
	^self attributes at: akey ifAbsent: [nil]
    ]

    attributeAt: akey ifAbsent: aBlock [
	<category: 'accessing'>
	^self attributes at: akey ifAbsent: aBlock
    ]

    attributeAt: akey ifAbsentPut: aBlock [
	<category: 'accessing'>
	^self attributes at: akey ifAbsentPut: aBlock
    ]

    attributeAt: akey put: aValue [
	<category: 'accessing'>
	^self attributes at: akey put: aValue
    ]

    contentType [
	<category: 'accessing'>
	self subclassResponsibility
    ]

    tag [
	<category: 'accessing'>
	^nil
    ]

    printJsonOn: aStream [
	<category: 'printing'>
	| str |
	str := WriteStream on: String new.
	self printHtmlOn: str.
	str contents printJsonOn: aStream
    ]

    printHtmlOn: aStream [
	<category: 'printing'>
	self beforePrintHtml.
	self printOpenTagOn: aStream.
	self childrenDo: [:each | 
	    each printHtmlOn: aStream].
	self printCloseTagOn: aStream.
	self afterPrintHtml
    ]

    afterPrintHtml [
	<category: 'printing'>
    ]

    beforePrintHtml [
	<category: 'printing'>
    ]

    printAttribute: anAttribute on: aStream [
	<category: 'printing'>
	aStream
	    nextPut: Character space;
	    nextPutAll: anAttribute key;
	    nextPut: $=;
	    nextPut: $";
	    nextPutAll: (Encoder encodeForHTTP: anAttribute value asString);
	    nextPut: $"
    ]

    printCloseTagOn: aStream [
	<category: 'printing'>
	self tag ifNotNil: [aStream nextPutAll: '</' , self tag , '>']
    ]

    printOpenTagOn: aStream [
	<category: 'printing'>
	self tag ifNotNil: [
	    aStream nextPutAll: '<' , self tag.
	    self attributes associationsDo: [:each | 
		each value ifNotNil: [
		    self printAttribute: each on: aStream]].
	    aStream nextPutAll: '>']
    ]

    build: aBuildable [
	<category: 'building'>
	aBuildable buildOn: self
    ]

    text: aString [
	<category: 'adding-conveniance'>
	^self add: (TextElement new
	    contents: aString;
	    yourself)
    ]

    attributeError: key [
	<category: 'error handling'>
	AttributeError signal: key
    ]

    doesNotUnderstandAttribute: aString [
	<category: 'error handling'>
	^(AttributeNotUnderstood element: self attribute: aString) signal
    ]

    respondOn: aResponse [
	<category: 'converting'>
	self printHtmlOn: aResponse.
	aResponse contentType: self contentType
    ]
]
