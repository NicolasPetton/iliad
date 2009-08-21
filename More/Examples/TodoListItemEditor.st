"======================================================================
|
|   Iliad.TodoListItemEditor class definition
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



Widget subclass: TodoListItemEditor [
    | item |
    
    <comment: nil>
    <category: 'Iliad-Core-Examples'>

    cancel [
	<category: 'accessing'>
	self answer: nil
    ]
    
    completedContents [
	<category: 'building'>
	^[:e | 
	    e tableData text: 'Completed'.
	    (e tableData checkbox)
		action: [:val | self setItemCompleted: val];
		checked: self item completed]
    ]

    contents [
	<category: 'building'>
	^[:e | 
	    | div |
	    div := e div
		class: 'edit';
		yourself.
	    div h2: 'Edit item'.
	    div build: self editFormContents]
    ]

    deadlineContents [
	<category: 'building'>
	^[:e | 
	    e tableData text: 'Deadline'.
	    e tableData anchor
		action: [self setItemDeadline];
		text: self item deadline asString]
    ]

    descriptionContents [
	<category: 'building'>
	^[:e | 
	    e tableData text: 'Decription'.
	    e tableData textArea
		text: self item description;
		columns: 40;
		rows: 4;
		action: [:val | self setItemDescription: val]]
    ]

    editFormContents [
	<category: 'building'>
	^[:e | 
	    | form tbody |
	    form := e form.
	    tbody := form table tableBody.
	    tbody tableRow build: self deadlineContents.
	    tbody tableRow build: self titleContents.
	    tbody tableRow build: self descriptionContents.
	    tbody tableRow build: self completedContents.
	    (form button)
		action: [self saveItem];
		text: 'save'.
	    form button
		action: [self cancel];
		text: 'cancel']
    ]

    titleContents [
	<category: 'building'>
	^[:e | 
	    e tableData text: 'Title'.
	    e tableData input
		value: self item title;
		size: 30;
		action: [:val | self setItemTitle: val]]
    ]

    item [
	<category: 'accessing'>
	^item
    ]

    item: anItem [
	<category: 'accessing'>
	item := anItem
    ]

    saveItem [
	<category: 'actions'>
	self answer: self item
    ]

    setItemCompleted: aBoolean [
	<category: 'actions'>
	self item completed: aBoolean
    ]

    setItemDeadline [
	<category: 'actions'>
	self show: Calendar new onAnswer: [:date |
		self item deadline: date]
    ]

    setItemDescription: aString [
	<category: 'actions'>
	self item description: aString
    ]

    setItemTitle: aString [
	<category: 'actions'>
	self item title: aString
    ]
]

