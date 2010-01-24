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
    | conditions errors key labelContents commentContents value action |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    ILField class >> on: aSelector of: anObject [
	<category: 'instance creation'>
	^self new
	    on: aSelector
	    of: anObject;
	    yourself
    ]

    key [
	<category: 'accessing'>
	^key
    ]

    key: aSymbol [
	<category: 'accessing'>
	key := aSymbol
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
	^value
    ]

    value: anObject [
	<category: 'accessing'>
	value := anObject
    ]

    errors [
	<category: 'accessing'>
	^errors ifNil: [{}]
    ]

    conditions [
	<category: 'accessing'>
	^conditions ifNil: [conditions := OrderedCollection new]
    ]

    setAction: aBlock [
	<category: 'accessing'>
	action := aBlock
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

    commit [
	<category: 'actions'>
	action value: self value
    ]

    buildContents [
	<category: 'building'>
	^Iliad.ILXHTMLElement new 
	    build: self tableRowContents;
	    yourself
    ]

    tableRowContents [
	<category: 'building'>
	^[:tbody|
	    tbody tr build: [:tr |
		self isValid ifFalse: [
		    tr class: 'error'].
		tr th 
		    build: self labelContents.
		tr td 
		    build: self fieldContents].
	    self commentContents ifNotNil: [
		tbody tr build: [:tr |
		    tr td.
			tr td
			    class: 'comment';
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

    on: aSelector of: anObject [
	<category: 'private'>
	key ifNil: [key := aSelector].
	labelContents ifNil: [self label: aSelector asString].
	value := anObject perform: aSelector.
	action := [:val | 
	    anObject perform: (aSelector, ':') asSymbol with: val]
    ]
]
