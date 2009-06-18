"======================================================================
|
|   Iliad.TextElement class definition
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



Element subclass: TextElement [
    | contents tag |

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    add: anElement [
	<category: 'adding'>
	ElementError signal: 'Can''t add an element to a ' , self class name
    ]

    big [
	<category: 'accessing'>
	self tag: 'big'
    ]

    blockquote [
	<category: 'accessing'>
	self tag: 'blockquote'
    ]

    bold [
	<category: 'accessing'>
	self tag: 'bold'
    ]

    cite [
	<category: 'accessing'>
	self tag: 'cite'
    ]

    code [
	<category: 'accessing'>
	self tag: 'code'
    ]

    contents [
	<category: 'accessing'>
	^contents ifNil: [contents := String new]
    ]

    contents: aString [
	<category: 'accessing'>
	contents := aString
    ]

    definition [
	<category: 'accessing'>
	self tag: 'dfn'
    ]

    definitionData [
	<category: 'accessing'>
	self tag: 'dd'
    ]

    definitionList [
	<category: 'accessing'>
	self tag: 'dl'
    ]

    definitionTerm [
	<category: 'accessing'>
	self tag: 'dt'
    ]

    emphasis [
	<category: 'accessing'>
	self tag: 'em'
    ]

    italic [
	<category: 'accessing'>
	self tag: 'i'
    ]

    preformatted [
	<category: 'accessing'>
	self tag: 'pre'
    ]

    quote [
	<category: 'accessing'>
	self tag: 'quote'
    ]

    small [
	<category: 'accessing'>
	self tag: 'small'
    ]

    strong [
	<category: 'accessing'>
	self tag: 'strong'
    ]

    subscript [
	<category: 'accessing'>
	self tag: 'subscript'
    ]

    superscript [
	<category: 'accessing'>
	self tag: 'superscript'
    ]

    tag [
	<category: 'accessing'>
	^tag
    ]

    tag: aString [
	<category: 'accessing'>
	tag := aString
    ]

    teletype [
	<category: 'accessing'>
	self tag: 'tt'
    ]

    variable [
	<category: 'accessing'>
	self tag: 'var'
    ]

    printHtmlOn: aStream [
	<category: 'printing'>
	self printOpenTagOn: aStream.
	aStream nextPutAll: (Encoder encodeForHTTP: self contents).
	self printCloseTagOn: aStream
    ]
]

