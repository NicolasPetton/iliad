"======================================================================
|
|   Iliad.ILTodoListGridWidget class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
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
    | selectBlock dataGrid |
    
    <comment: nil>
    <category: 'Iliad-More-Examples'>

    addNewItem [
	<category: 'actions'>
	| newItem |
	newItem := ILTodoListItem new.
	self lightbox: ((self formulaForItem: newItem)
	    addMessage: [:e | e h2: 'Add item ', newItem title];
	    yourself)
	    onAnswer: [:item | item ifNotNil: [
		self application model addItem: item.
		self updateDataGridItems]]
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
	self updateDataGridItems
    ]

    updateDataGridItems [
	<category: 'updating'>
	self dataGrid items: 
	    (self items asSortedCollection: [:a :b | a deadline < b deadline])
    ]

    contents [
	<category: 'building'>
	^[:e |
	    self updateDataGridItems.
	    e build: self dataGrid.
	    e div a
		action: [self addNewItem];
		text: 'new']
    ]

    formulaForItem: anItem [
	<category: 'accessing'>
	| formula |
	formula := ILFormula on: anItem.
	(formula dateInputOn: #deadline)
	    label: 'Deadline'.
	(formula inputOn: #title)
	    labelContents: [:e | e span class: 'required';text: 'Title'];
	    addCondition: [:val | val notNil and: [val notEmpty]]
	    labelled: [:val | 'This field is required'].
	(formula textareaOn: #body)
	    labelContents: [:e | e span class: 'required';text: 'Body'];
	    size: 30@10;
	    addCondition: [:val | val notNil and: [val notEmpty]]
	    labelled: [:val | 'This field is required'].
	(formula checkboxOn: #completed)
	    label: 'Completed'.
	^formula
    ]

    dataGrid [
	<category: 'accessing'>
	^dataGrid ifNil: [
	    dataGrid := (ILPagedDataGrid new
		items: (self items asSortedCollection: [:a :b | a deadline < b deadline]);
		columnNames: #('' 'Title' 'Body' 'Deadline' '' '');
		column: 1 buildContents: [:e :item | e form checkbox
		    checked: item completed;
		    beSubmitOnClick;
		    action: [:val | self setItem: item completed: val]];
		column: 2 buildContents: [:e :item | e text: item title];
		column: 3 buildContents: [:e :item | e text: item body];
		column: 4 buildContents: [:e :item | e text: item deadline greaseString];
		column: 5 buildContents: [:e :item | e a text: 'Edit'; action: [self editItem: item]];
		column: 6 buildContents: [:e :item | e a text: 'Remove'; action: [self removeItem: item]];
		rowsPerPage: 3;
		yourself)]
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

