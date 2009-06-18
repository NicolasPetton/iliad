"======================================================================
|
|   Iliad.InputElement class definition
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



FormElementElement subclass: InputElement [

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    tag [
	<category: 'accessing'>
	^'input'
    ]

    accept: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'accept' put: aString
    ]

    accepts: aCollection [
	<category: 'accessing attributes'>
	| contentTypes |
	contentTypes := WriteStream on: String new.
	aCollection do: [:each | contentTypes nextPutAll: each]
	    separatedBy: [contentTypes nextPutAll: ' '].
	self accept: contentTypes contents
    ]

    alt: aString [
	<category: 'accessing attributes'>
	self alternativeText: aString
    ]

    alternativeText: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'alt' put: aString
    ]

    isMap [
	<category: 'accessing attributes'>
	self attributeAt: 'ismap' put: 'ismap'
    ]

    maxLength: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'maxlength' put: anInteger printString
    ]

    size: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'size' put: anInteger printString
    ]

    source: aString [
	<category: 'accessing attributes'>
	self doesNotUnderstandAttribute: 'src'
    ]

    useMap: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'usemap' put: aString
    ]

    value: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'value' put: aString
    ]

    beFile [
	<category: 'accessing attributes-types'>
	self type: 'file'
    ]

    beHidden [
	<category: 'accessing attributes-types'>
	self type: 'hidden'
    ]

    beImage [
	<category: 'accessing attributes-types'>
	self type: 'image'
    ]

    bePassword [
	<category: 'accessing attributes-types'>
	self type: 'password'
    ]

    beRadio [
	<category: 'accessing attributes-types'>
	self type: 'radio'
    ]

    beReset [
	<category: 'accessing attributes-types'>
	self type: 'reset'
    ]

    beSubmit [
	<category: 'accessing attributes-types'>
	self type: 'submit'
    ]

    beText [
	<category: 'accessing attributes-types'>
	self type: 'text'
    ]

    type: aString [
	<category: 'accessing attributes-types'>
	self attributeAt: 'type' put: aString
    ]

    beforePrintHtml [
	<category: 'printing'>
	self attributeAt: 'type' ifAbsentPut: ['text']
    ]

    printHtmlOn: aStream [
	<category: 'printing'>
	self beforePrintHtml.
	aStream
	    nextPut: $<;
	    nextPutAll: self tag.
	self attributes 
	    associationsDo: [:each | self printAttribute: each on: aStream].
	aStream nextPutAll: '/>'
    ]
]

