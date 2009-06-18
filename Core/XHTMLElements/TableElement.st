"======================================================================
|
|   Iliad.TableElement class definition
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



XHTMLElement subclass: TableElement [

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    tag [
	<category: 'accessing'>
	^'table'
    ]

    aboveFrame [
	<category: 'accessing attributes'>
	self frame: 'above'
    ]

    allRules [
	<category: 'accessing attributes'>
	self rules: 'all'
    ]

    belowFrame [
	<category: 'accessing attributes'>
	self frame: 'below'
    ]

    border: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'border' put: anInteger printString
    ]

    borderFrame [
	<category: 'accessing attributes'>
	self frame: 'border'
    ]

    boxFrame [
	<category: 'accessing attributes'>
	self frame: 'box'
    ]

    cellPadding: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'cellpadding' put: anInteger printString
    ]

    cellSpacing: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'cellspacing' put: anInteger printString
    ]

    columnRules [
	<category: 'accessing attributes'>
	self rules: 'cols'
    ]

    frame: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'frame' put: aString
    ]

    groupRules [
	<category: 'accessing attributes'>
	self rules: 'groups'
    ]

    horizontalFrame [
	<category: 'accessing attributes'>
	self frame: 'hsides'
    ]

    leftSideFrame [
	<category: 'accessing attributes'>
	self frame: 'lhs'
    ]

    noRules [
	<category: 'accessing attributes'>
	self rules: 'none'
    ]

    rightSideFrame [
	<category: 'accessing attributes'>
	self frame: 'rhs'
    ]

    rowRules [
	<category: 'accessing attributes'>
	self rules: 'rows'
    ]

    rules: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'rules' put: aString
    ]

    summary: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'summary' put: aString
    ]

    verticalFrame [
	<category: 'accessing attributes'>
	self frame: 'vsides'
    ]

    voidFrame [
	<category: 'accessing attributes'>
	self frame: 'void'
    ]

    width: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'width' put: anInteger printString
    ]
]

