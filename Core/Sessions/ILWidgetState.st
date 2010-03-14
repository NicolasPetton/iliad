"======================================================================
|
|   Iliad.ILWidgetState class definition
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


ILObject subclass: ILWidgetState [
    | widget state stateId |
    
    <category: 'Iliad-Core-Sessions'>
    <comment: nil>

    ILWidgetState class >> on: aWidget [
	<category: 'instance creation'>
	^self basicNew
	    initializeWithWidget: aWidget;
	    yourself
    ]

    initializeWithWidget: aWidget [
	<category: 'initialize-release'>
	state = #clean.
	stateId := ILId new: 8.
	widget := aWidget
    ]

    = aState [
	<category: 'comparing'>
	^(aState species = self species 
	    and: [other stateId = self stateId])
	    and: [other state = self state]
    ]

    hash [
	<category: 'comparing'>
	^self widget hash bitXor: self stateId hash
    ]

    widget [
	<category: 'accessing'>
	^widget
    ]

    stateId [
	<category: 'accessing'>
	^stateId copy
    ]

    state [
	<category: 'accessing'>
	^state
    ]

    setClean [
	<category: 'states'>
	state := #clean.
	self setStateId
    ]

    setDirty [
	<category: 'states'>
	state := #dirty.
	self setStateId
    ]

    setAppended [
	<category: 'states'>
	state := #appended.
	self setStateId
    ]

    setPrepended [
	<category: 'states'>
	state := #prepended.
	self setStateId
    ]

    isDirty [
	<category: 'states'>
	^state = #dirty
    ]

    isAppended [
	<category: 'states'>
	^state = #appended
    ]

    isPrepended [
	<category: 'states'>
	^state = #prepended
    ]

    setStateId [
	<category: 'private'>
	stateId := ILId new: 8
    ]
]
