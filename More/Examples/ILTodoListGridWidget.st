"======================================================================
|
|   Iliad.ILTodoListGridWidget class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
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




ILWidget subclass: ILTodoListGridWidget [
    | selectBlock |
    
    <comment: nil>
    <category: 'Iliad-More-Examples'>

    addNewItem [
	<category: 'actions'>
	| newItem |
	newItem := ILTodoListItem new.
	self lightbox: ((self formulaForItem: newItem)
	    addMessage: [:e | e h2: 'Add item ', newItem title];
	    yourself)
	    onAnswer: [:item | item ifNotNil: [self application model addItem: item]]
    ]

    editItem: anItem [
	<category: 'actions'>
	self lightbox: ((self formulaForItem: anItem)
	    addMessage: [:e | e h2: 'Edit item ', anItem title];
	    yourself)
    ]

    removeItem: anItem [
	<category: 'actions'>
	self application model removeItem: anItem.
	self markDirty
    ]

    setItem: anItem completed: aBoolean [
	<category: 'actions'>
	anItem completed: aBoolean.
	self markDirty
    ]

    contents [
	<category: 'building'>
	^[:e || table |
	    table := e table.
	    table build: self tableHeadContents.
	    (self items asSortedCollection: [:a :b | a deadline < b deadline]) 
		do: [:each | table build: (self rowContentsForItem: each)].
	    e div a
		action: [self addNewItem];
		text: 'new']
    ]

    rowContentsForItem: anItem [
	<category: 'building'>
	^[:e || row |
	    row := e tr.
	    (row td form checkbox)
		checked: anItem completed;
		beSubmitOnClick;
		action: [:val | self setItem: anItem completed: val].
	    row td text: anItem title.
	    row td text: anItem body.
	    row td text: anItem deadline asString.
	    row td a
		action: [self editItem: anItem];
		text: 'edit'.
	    row td a
		action: [self removeItem: anItem];
		text: 'remove']
    ]

    tableHeadContents [
	<category: 'building'>
	^[:e || head |
	    head := e thead.
	    head td text: ''.
	    head td text: 'Title'.
	    head td text: 'Body'.
	    head td text: 'Deadline']
    ]

    formulaForItem: anItem [
	<category: 'accessing'>
	| formula |
	formula := ILFormula on: anItem.
	(formula inputOn: #title)
	    labelContents: [:e | e span class: 'required';text: 'Title'];
	    addCondition: [:val | val notNil and: [val notEmpty]]
	    labelled: [:val | 'This field is required'].
	(formula textareaOn: #body)
	    labelContents: [:e | e span class: 'required';text: 'Body'];
	    size: 30@10;
	    addCondition: [:val | val notNil and: [val notEmpty]]
	    labelled: [:val | 'This field is required'].
	(formula dateInputOn: #deadline)
	    addCondition: [:val | val notNil]
	    labelled: [:label | label, ' is required'].
	(formula checkboxOn: #completed)
	    labelContents: [:e | e text: 'Title'].
	^formula
    ]

    items [
	<category: 'accessing'>
	^self application model items select: self selectBlock
    ]

    selectBlock [
	<category: 'accessing'>
	^selectBlock ifNil: [selectBlock := [:each | each completed not]]
    ]

    selectBlock: aBlock [
	<category: 'accessing'>
	selectBlock := aBlock
    ]
]

