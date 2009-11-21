"======================================================================
|
|   Iliad.ILTodoListApplication class definition
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



ILApplication subclass: ILTodoListApplication [
    | todoListGridWidget |
    
    <comment: nil>
    <category: 'Iliad-Core-Examples'>

    ILTodoListApplication class >> path [
	<category: 'accessing'>
	^'examples/todo'
    ]

    selectCompleted [
	<category: 'accessing'>
	self todoListGridWidget selectBlock: [:item | item completed].
	self markDirty
    ]

    selectPending [
	<category: 'accessing'>
	self todoListGridWidget selectBlock: [:item | item completed not].
	self markDirty
    ]

    todoListGridWidget [
	<category: 'accessing'>
	^todoListGridWidget ifNil: [todoListGridWidget := ILTodoListGridWidget new]
    ]

    initialize [
	<category: 'initialize-release'>
	super initialize.
	self model: ILTodoListItemRepository default
    ]

    updateFromHash [
	<category: 'building'>
	| path |
	path := self hashRoute next.
	path = 'pending' ifTrue: [self selectPending].
	path = 'completed' ifTrue: [self selectCompleted] 
    ]

    updatePage: aPage [
	<category: 'building'>
	super updatePage: aPage.
	aPage head stylesheet href: '/stylesheets/iliad.css'
    ]

    index [
	<category: 'controllers'>
	self updateFromHash.
	^self mainContents
    ]

    mainContents [
	<category: 'building'>
	^ [:e |
	    e h1: 'Todo List'.
	    e build: self actionLinksContents.
	    e build: self todoListGridWidget]
    ]

    actionLinksContents [
	<category: 'building'>
	^[:e ||div|
	    div := e div class: 'selection'; yourself.
	    div a
		action: [self selectPending]
		hash: 'pending';
		text: 'pending'.
	    div space.
	    div a
		action: [self selectCompleted]
		hash: 'completed';
		text: 'completed'.
	    e br]
    ]
]
