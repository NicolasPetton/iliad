"======================================================================
|
|   Iliad.TodoListApplication class definition
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




Application subclass: TodoListApplication [
    | todoListWidget |
    
    <comment: nil>
    <category: 'Iliad-Core-Examples'>

    TodoListApplication class >> path [
	<category: 'accessing'>
	^'examples/todo'
    ]

    all [
	<category: 'views'>
	self todoListWidget selectBlock: [:item | true].
	^self mainContents
    ]

    completed [
	<category: 'views'>
	self todoListWidget selectBlock: [:item | item completed].
	^self mainContents
    ]

    index [
	<category: 'views'>
	^self all
    ]

    pending [
	<category: 'views'>
	self todoListWidget selectBlock: [:item | item completed not].
	^self mainContents
    ]

    initialize [
	<category: 'initialize-release'>
	super initialize.
	self model: TodoListItemRepository default
    ]

    mainContents [
	<category: 'views-parts'>
	^
	[:e | 
	e h1: 'Todo list'.
	e build: self selectionContents.
	e add: self todoListWidget build]
    ]

    selectionContents [
	<category: 'views-parts'>
	^
	[:e | 
	| div |
	div := (e div)
		class: 'selection';
		yourself.
	#('all' 'completed' 'pending') do: 
		[:each | 
		(div anchor)
		    action: [self redirectToLocal: each];
		    text: each]
	    separatedBy: [div space].
	e break]
    ]

    todoListWidget [
	<category: 'accessing'>
	^todoListWidget ifNil: [todoListWidget := TodoListWidget new]
    ]

    updatePage [
	<category: 'building'>
	super updatePage.
	self page headElement stylesheet href: '/stylesheets/iliad.css'
    ]
]

