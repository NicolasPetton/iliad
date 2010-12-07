"======================================================================
|
|   Iliad.ILFieldContainer class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2010 
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



ILWidget subclass: ILFieldContainer [
    | fields label formula |
	
    <category: 'Iliad-More-Formula'>
    <comment: nil>

    ILFieldContainer class >> on: aFormula label: aString [
	<category: 'instance creation'>
	^self new
	    formula: aFormula;
	    label: aString;
	    yourself
    ]

    postCopyTo: aFormula [
	<category: 'copying'>
	self formula: aFormula.
	fields := self fields collect: [:each | 
	    each copy postCopyTo: self; yourself]
    ]

    formula: aFormula [
	<category: 'accessing'>
	formula := aFormula
    ]

    formula [
	<category: 'accessing'>
	^formula
    ]

    label [
	<category: 'accessing'>
	^label ifNil: ['']
    ]

    label: aString [
	<category: 'accessing'>
	label := aString
    ]

    fields [
	<category: 'accessing'>
	^fields ifNil: [fields := OrderedCollection new]
    ]

    addField: aField [
	<category: 'adding'>
	^self fields add: aField
    ]

    setFields: aCollection [
	<category: 'accessing'>
	fields := aCollection.
    ]

    contents [
	<category: 'building'>
	^[:e || root |
	    root := self useFieldset 
    		ifTrue: [
		    (e fieldset legend: self label) div class: 'fields']
		ifFalse: [e div class: 'fields'].
	    root build: self tableContents]
    ]

    tableContents [
	<category: 'building'>
	^[:e |
	    e table tbody build: [:tbody |
		self fields do: [:each |
		    tbody build: each]]]
    ]

    useFieldset [
	<category: 'testing'>
	^self label notEmpty
    ]
]
