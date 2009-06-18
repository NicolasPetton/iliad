"======================================================================
|
|   Iliad.TodoListWidget class definition
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



Widget subclass: TodoListWidget [
    | selectBlock |
    
    <comment: nil>
    <category: 'Iliad-Core-Examples'>

    addNewItem [
	<category: 'actions'>
	| newItem |
	newItem := TodoListItem new.
	self lightbox: ((TodoListItemEditor new)
	    item: newItem;
	    yourself)
	    onAnswer: [:item |
		item ifNotNil: [self application model addItem: item]]
    ]

    editItem: anItem [
	<category: 'actions'>
	self lightbox: ((TodoListItemEditor new)
	    item: anItem;
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
	^[:e | 
	    | table |
	    table := e table.
	    table build: self tableHeadContents.
	    (self items asSortedCollection: [:a :b | a deadline < b deadline]) 
		do: [:each | table build: (self rowContentsForItem: each)].
	    (e div anchor)
		action: [self addNewItem];
		text: 'new']
    ]

    rowContentsForItem: anItem [
	<category: 'building'>
	^[:e | 
	    | row |
	    row := e tableRow.
	    (row tableData form checkbox)
		checked: anItem completed;
		beSubmitOnClick;
		action: [:val | self setItem: anItem completed: val].
	    row tableData text: anItem title.
	    row tableData text: anItem description.
	    row tableData text: anItem deadline asString.
	    (row tableData anchor)
		action: [self editItem: anItem];
		text: 'edit'.
	    (row tableData anchor)
		action: [self removeItem: anItem];
		text: 'remove']
    ]

    tableHeadContents [
	<category: 'building'>
	^[:e | 
	    | head |
	    head := e tableHead.
	    head tableData text: ''.
	    head tableData text: 'Title'.
	    head tableData text: 'Description'.
	    head tableData text: 'Deadline']
    ]

    items [
	<category: 'accessing'>
	^self application model items select: self selectBlock
    ]

    selectBlock [
	<category: 'accessing'>
	^selectBlock ifNil: [selectBlock := [:each | ]]
    ]

    selectBlock: aBlock [
	<category: 'accessing'>
	selectBlock := aBlock
    ]
]

