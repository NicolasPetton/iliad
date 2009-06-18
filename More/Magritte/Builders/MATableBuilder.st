"======================================================================
|
|   Magritte.MATableBuilder class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from Magritte-Seaside written by Lukas Renggli 
| http://source.lukas-renggli.ch/magritte.
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



MAWidgetBuilder subclass: MATableBuilder [
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Builders'>

    buildContainerFor: aDescription [
	<category: 'building'>
	^[:e | 
	    e
		class: (self classFor: aDescription);
		build: (super buildContainerFor: aDescription)]
    ]

    buildControlFor: aDescription [
	<category: 'building'>
	^[:e | 
	    e tableData
		class: (self classFor: aDescription);
		build: (super buildControlFor: aDescription)]
    ]

    buildElementFor: aDescription [
	<category: 'building'>
	^[:e | 
	    aDescription group = group ifFalse: [
		self buildGroupFor: aDescription].
	    e tableRow
		build: (self buildLabelFor: aDescription);
		build: (self buildControlFor: aDescription)]
    ]

    buildGroupFor: aDescription [
	<category: 'building'>
	^[:e || trow |
	    e build: (super buildGroupFor: aDescription).
	    group isNil ifTrue: [^self].
	    trow := e tableRow
		class: 'group';
		yourself.
	    trow tableHeading
		colSpan: 2;
		text: group]
    ]

    buildLabelFor: aDescription [
	<category: 'building'>
	^[:e | 
	e tableHeader
	    title: aDescription comment;
	    class: (self classFor: aDescription);
	    build: (super buildLabelFor: aDescription)]
    ]

    setElement: anElement [
	element := anElement table
    ]
]

