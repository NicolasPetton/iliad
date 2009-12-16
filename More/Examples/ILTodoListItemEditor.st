"======================================================================
|
|   Iliad.ILTodoListItemEditor class definition
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



ILWidget subclass: ILTodoListItemEditor [
    | item formula |
    
    <comment: nil>
    <category: 'Iliad-Core-Examples'>

    initFormula [
	<category: 'initialize-release'>
	formula := ILFormula on: self item.
	(formula inputOn: #title)
	    addCondition: [:val | val notNil and: [val notEmpty]]
	    labelled: [:label | label, ' is required'].
	(formula textareaOn: #body)
	    size: 40@30;
	    addCondition: [:val | val notNil and: [val notEmpty]]
	    labelled: [:label | label, ' is required'].
	"(formula dateInputOn: #deadline)
	    addCondition: [:val | val notNil]
	    labelled: [:label | label, ' is required']."
	formula checkboxOn: #completed
    ]

    contents [
	<category: 'building'>
	^[:e | 
	    | div |
	    div := e div
		class: 'edit';
		yourself.
	    div h2: 'Edit item'.
	    div build: self formula]
    ]

    formula [
	<category: 'accessing'>
	formula ifNil: [self initFormula].
	^formula
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

    cancel [
	<category: 'actions'>
	self answer: nil
    ]
]

