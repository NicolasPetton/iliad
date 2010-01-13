"======================================================================
|
|   Iliad.ILTableCellElement class definition
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



ILTableElementElement subclass: ILTableCellElement [

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    abbr: aString [
	<category: 'accessing attributes-table'>
	self attributeAt: 'abbr' put: aString
    ]

    axis: aString [
	<category: 'accessing attributes-table'>
	self attributeAt: 'axis' put: aString
    ]

    colgroupScope [
	<category: 'accessing attributes-table'>
	self scope: 'colgroup'
    ]

    colScope [
	<category: 'accessing attributes-table'>
	self scope: 'col'
    ]

    colspan: anInteger [
	<category: 'accessing attributes-table'>
	self attributeAt: 'colspan' put: anInteger printString
    ]

    headers: aCollection [
	<category: 'accessing attributes-table'>
	| headers |
	headers := WriteStream on: String new.
	aCollection do: [:each | headers nextPutAll: each]
	    separatedBy: [headers nextPutAll: ','].
	self attributeAt: 'headers' put: headers contents
    ]

    rowgroupScope [
	<category: 'accessing attributes-table'>
	self scope: 'rowgroup'
    ]

    rowScope [
	<category: 'accessing attributes-table'>
	self scope: 'row'
    ]

    rowspan: anInteger [
	<category: 'accessing attributes-table'>
	self attributeAt: 'rowspan' put: anInteger printString
    ]

    scope: aString [
	<category: 'accessing attributes-table'>
	self attributeAt: 'scope' put: aString
    ]
]

