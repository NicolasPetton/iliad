"======================================================================
|
|   Iliad.ILObjectElement class definition
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



ILHTMLBuilderElement subclass: ILObjectElement [

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    tag [
	<category: 'accessing'>
	^'object'
    ]
    
    archive: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'archive' put: aString
    ]

    archives: aCollection [
	<category: 'accessing attributes'>
	| archives |
	archives := WriteStream on: String new.
	aCollection do: [:each | archives nextPutAll: each]
	    separatedBy: [archives nextPutAll: ' '].
	self attributeAt: 'archive' put: archives contents
    ]

    classid: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'classid' put: aString
    ]

    codebase: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'codebase' put: aString
    ]

    codetype: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'codetype' put: aString
    ]

    data: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'data' put: aString
    ]

    declare [
	<category: 'accessing attributes'>
	self attributeAt: 'declare' put: 'declare'
    ]

    declareOnly [
	<category: 'accessing attributes'>
	self declare
    ]

    height: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'height' put: anInteger greaseString
    ]

    name: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'name' put: aString
    ]

    standby: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'standby' put: aString
    ]

    tabindex: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'tabindex' put: anInteger greaseString
    ]

    type: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'type' put: aString
    ]

    usemap: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'usemap' put: aString
    ]

    width: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'width' put: anInteger greaseString
    ]
]

