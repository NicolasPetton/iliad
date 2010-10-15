"======================================================================
|
|   Iliad.ILTableElementElement class definition
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



ILHTMLBuilderElement subclass: ILTableElementElement [

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    align: aString [
	<category: 'accessing attributes-table'>
	self attributeAt: 'align' put: aString
    ]

    baselineValign [
	<category: 'accessing attributes-table'>
	self valign: 'baseline'
    ]

    bottomValign [
	<category: 'accessing attributes-table'>
	self valign: 'bottom'
    ]

    centerAlign [
	<category: 'accessing attributes-table'>
	self align: 'center'
    ]

    character: aCharacter [
	<category: 'accessing attributes-table'>
	| alignment |
	alignment := self attributeAt: 'align' ifAbsent: ['left'].
	alignment = 'char' 
	    ifFalse: [self attributeError: 'Alignment must be "char"'].
	self attributeAt: 'char' put: aCharacter greaseString
    ]

    characterAlign [
	<category: 'accessing attributes-table'>
	self align: 'char'
    ]

    charoff: anInteger [
	<category: 'accessing attributes-table'>
	self attributeAt: 'char'
	    ifAbsent: [self attributeError: 'Must specify alignment character'].
	self attributeAt: 'charoff' put: anInteger greaseString
    ]

    justifyAlign [
	<category: 'accessing attributes-table'>
	self align: 'justify'
    ]

    leftAlign [
	<category: 'accessing attributes-table'>
	self align: 'left'
    ]

    middleValign [
	<category: 'accessing attributes-table'>
	self valign: 'middle'
    ]

    rightAlign [
	<category: 'accessing attributes-table'>
	self align: 'right'
    ]

    topValign [
	<category: 'accessing attributes-table'>
	self valign: 'top'
    ]

    valign: aString [
	<category: 'accessing attributes-table'>
	self attributeAt: 'valign' put: aString
    ]
]

