"======================================================================
|
|   Iliad.ILField class definition
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




ILBuildable subclass: ILField [
    | conditions errors reader writer labelContents commentContents formula |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    ILField class >> on: aFormula selector: aSelector [
	<category: 'instance creation'>
	^self new
	    on: aFormula
	    selector: aSelector;
	    yourself
    ]

    reader [
	<category: 'accessing'>
	^reader
    ]

    reader: aSymbol [
	<category: 'accessing'>
	reader := aSymbol
    ]

    writer [
	<category: 'accessing'>
	^writer
    ]

    writer: aSymbol [
	<category: 'accessing'>
	writer := aSymbol
    ]

    label: aString [
	<category: 'accessing'>
	self labelContents: [:e | e text: aString]
    ]

    labelContents: aBlock [
	<category: 'accessing'>
	labelContents := aBlock
    ]

    labelContents [
	<category: 'accessing'>
	^labelContents
    ]

    comment: aString [
	<category: 'accessing'>
	self commentContents: [:e | e text: aString]
    ]

    commentContents: aBlock [
	<category: 'accessing'>
	commentContents := aBlock
    ]

    commentContents [
	<category: 'accessing'>
	^commentContents 
    ]

    value [
	<category: 'accessing'>
	^formula proxy perform: self reader
    ]

    value: anObject [
	<category: 'accessing'>
	formula proxy 
	    perform: self writer
	    with: anObject
    ]

    errors [
	<category: 'accessing'>
	^errors ifNil: [{}]
    ]

    conditions [
	<category: 'accessing'>
	^conditions ifNil: [conditions := OrderedCollection new]
    ]

    addCondition: aCondition [
	<category: 'conditions'>
	self conditions add: aCondition
    ]

    addCondition: aBlock labelled: anotherBlock [
	<category: 'conditions'>
	self addCondition: (ILCondition new
	    conditionBlock: aBlock;
	    labelBlock: anotherBlock;
	    yourself)
    ]

    validate [
	<category: 'actions'>
	errors := OrderedCollection new.
	self conditions do: [:each |
	    (each validate: self value) ifFalse: [
		self errors add: (each labelFor: self value)]].
    ]

    build [
	<category: 'building'>
	^Iliad.ILXHTMLElement new 
	    build: self tableRowContents;
	    yourself
    ]

    tableRowContents [
	<category: 'building'>
	^[:tbody|
	    tbody tr build: [:tr |
		tr cssClass: 'field'.
		self isValid ifFalse: [
		    tr cssClass: tr cssClass, ' error'].
		tr th 
		    build: self labelContents.
		tr td 
		    build: self fieldContents].
	    self commentContents ifNotNil: [
		tbody tr build: [:tr |
		    tr td.
			tr td
			    cssClass: 'comment';
			    build: self commentContents]].
	    tbody build: self errorsContents]
    ]

    fieldContents [
	<category: 'building'>
	self subclassResponsibility
    ]

    errorsContents [
	<category: 'building'>
	^[:tbody |
	    self errors notEmpty ifTrue: [
		tbody tr build: [:tr |
		    tr td.
		    tr td div 
			class: 'errors';
			build: [:div |
			    div text: self errors first]]]]
    ]

    isValid [
	<category: 'testing'>
	^self errors isEmpty
    ]

    isMultipart [
	<category: 'testing'>
	^false
    ]

    on: aFormula selector: aSelector [
	<category: 'private'>
	reader ifNil: [reader := aSelector].
	writer ifNil: [writer := (aSelector, ':') asSymbol].
	labelContents ifNil: [self label: aSelector greaseString].
	formula := aFormula
    ]
]
