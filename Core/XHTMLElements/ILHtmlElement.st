"======================================================================
|
|   Iliad.ILHtmlElement class definition
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



ILXHTMLElement subclass: ILHtmlElement [

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    ILHtmlElement class >> doctype [
	<category: 'defaults'>
	^'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'
    ]

    ILHtmlElement class >> xmlns [
	<category: 'defaults'>
	^'http://www.w3.org/1999/xhtml'
    ]

    doctype [
	<category: 'accessing'>
	^self class doctype
    ]

    tag [
	<category: 'accessing'>
	^'html'
    ]

    xmlTag [
	<category: 'accessing'>
	^'<?xml version="1.0" encoding="', self session encoding, '"?>'
    ]
    
    version: aNumber [
	<category: 'accessing attributes'>
	self attributeAt: 'version' put: aNumber printString
    ]

    xmlns: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'xmlns' put: aString
    ]

    onEvent: event do: aString [
	<category: 'accessing attributes-events'>
	self doesNotUnderstandAttribute: 'on' , event
    ]

    beforePrintHtml [
	<category: 'printing'>
	self attributeAt: 'xmlns' ifAbsentPut: [self class xmlns].
	self attributeAt: 'lang' ifAbsentPut: [self session language asString].
	self attributeAt: 'xml:lang' ifAbsentPut: [self session language asString]
    ]

    printHtmlOn: aStream [
	<category: 'printing'>
	aStream nextPutAll: self xmlTag.
	aStream nextPutAll: self doctype.
	super printHtmlOn: aStream
    ]
]



