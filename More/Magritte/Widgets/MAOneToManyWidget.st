"======================================================================
|
|   Magritte.MAOneToManyWidget class definition
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



MARelationWidget subclass: MAOneToManyWidget [
    | report commands |
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Widgets'>

    MAOneToManyWidget class >> isAbstract [
	<category: 'testing'>
	^false
    ]

    children [
	<category: 'accessing'>
	^Array with: self report
    ]

    commands [
	<category: 'accessing'>
	^commands ifNil: [commands := self buildCommands]
    ]

    report [
	<category: 'accessing'>
	^report ifNil: [report := self buildReport]
    ]

    add [
	<category: 'actions'>
	self root 
	    show: ((self selected new asWidget)
		addMessage: 'Add ' , self selected label;
		addValidatedForm;
		yourself)
	    onAnswer: [:ans | 
		ans ifNotNil: [
		    self value: (self value copyWith: ans); refresh]]
    ]

    down: anElement [
	<category: 'actions'>
	self value moveDown: anElement
    ]

    edit: anObject [
	<category: 'actions'>
	self root show: ((anObject asWidget)
	    addMessage: 'Edit ' , self selected label;
	    addValidatedForm;
	    yourself).
	self refresh
    ]

    refresh [
	<category: 'actions'>
	self report rows: self value
    ]

    remove: anObject [
	<category: 'actions'>
	self value: (self value copyWithout: anObject).
	self refresh
    ]

    up: anElement [
	<category: 'actions'>
	self value moveUp: anElement
    ]

    editorContents [
	<category: 'building'>
	^[:e | 
	    e build: self viewerContents.
	    self description isDefinitive ifFalse: [
		e build: self selectListContents]]
    ]

    viewerContents [
	<category: 'building'>
	^[:e || columns |
	    columns := self report columns copyWithout: self commands.
	    self report columns: (self isReadonly 
		ifFalse: [columns copyWith: self commands]
		ifTrue: [columns]).
	    e build: self report]
    ]

    selectButtonContents [
	<category: 'building-buttons'>
	^[:e | 
	e button
	    text: 'Add';
	    action: [self add]]
    ]

    buildCommands [
	<category: 'private'>
	commands := MACommandColumnWidget new setReport: self report.
	self description isDefinitive ifFalse: [
	    commands
	        addCommandOn: self selector: #edit: text: 'edit';
	        addCommandOn: self selector: #remove: text: 'remove'].
	self description isOrdered ifTrue: [
	    commands
	        addCommandOn: self selector: #up: text: 'up';
		addCommandOn: self selector: #down: text: 'down'].
	^commands
    ]

    buildReport [
	<category: 'private'>
	^(MAReportWidget rows: self value description: self reference)
	    sortEnabled: self description isOrdered not;
	    yourself
    ]
]

