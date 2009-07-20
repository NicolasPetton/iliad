"======================================================================
|
|   Iliad.ActionRegistry class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
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


IliadObject subclass: ActionRegistry [
    | actions owner |
    
    <category: 'Iliad-Core-Sessions'>
    <comment: 'I implement a registry of actions.
    
    My <owner> is responsible for registering actions,
    and unregister them when they are obsolete. 
    
    Action registries should always be stored in Iliad sessions.'>

    ActionRegistry class >> owner: aWidget [
	<category: 'instance creation'>
	^self basicNew
	    owner: aWidget;
	    initialize;
	    yourself
    ]

    actionAt: aKeyString [
	<category: 'accessing'>
	^self actions 
	    detect: [:each | each key = aKeyString] 
	    ifNone: [nil]
    ]

    actions [
	<category: 'accessing'>
	^actions ifNil: [actions := OrderedCollection new]
    ]

    owner [
	<category: 'accessing'>
	^owner
    ]

    owner: anObject [
	<category: 'accessing'>
	owner := anObject
    ]

    evaluate: anAction [
	<category: 'actions'>
	(self actions includes: anAction) ifTrue: [
	    anAction evaluate]
    ]

    evaluateActionKey: aString [
	<category: 'actions'>
	| action |
	action := self actionAt: aString.
	action ifNotNil: [self evaluate: action]
    ]

    register: anAction [
	<category: 'actions'>
	self actions add: anAction
    ]

    unregister: anAction [
	<category: 'actions'>
	(self actions includes: anAction) ifTrue: [
	    self actions remove: anAction]
    ]

    unregisterAllActions [
	<category: 'actions'>
	actions := nil
    ]
]

