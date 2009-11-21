"======================================================================
|
|   Iliad.ILRSSRssElement class definition
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


ILRSSElement subclass: ILRSSRssElement [
    
    <comment: nil>
    <category: 'Iliad-More-RSS'>

    tag [
	<category: 'accessing'>
	^'rss'
    ]

    xmlTag [
	<category: 'accessing'>
	^'<?xml version="1.0"?>'
    ]

    blogChannel: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'xmlns:blogChannel' put: aString
    ]

    version [
	<category: 'accessing attributes'>
	^self attributeAt: 'version'
    ]

    version: aNumber [
	<category: 'accessing attributes'>
	self attributeAt: 'version' put: aNumber printString
    ]

    xmlns: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'xmlns' put: aString
    ]

    beforePrintHtml [
	<category: 'printing'>
	self version ifNil: [self version: 2.0]
    ]

    printHtmlOn: aStream [
	<category: 'printing'>
	aStream nextPutAll: self xmlTag.
	super printHtmlOn: aStream
    ]
]

