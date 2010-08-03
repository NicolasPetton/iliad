"======================================================================
|
|   Iliad.ILStateRegistry class definition
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


ILObject subclass: ILStateRegistry [
    | key states |
    
    <category: 'Iliad-Core-Sessions'>
    <comment: nil>

    ILStateRegistry class >> fromRegistry: aStateRegistry [
	<category: 'instance creation'>
	^self new
	    setStates: aStateRegistry states copy;
	    yourself
    ]

    key [
	<category: 'accessing'>
	^key ifNil: [key := self session nextId]
    ]

    stateAt: aWidget [
	<category: 'accessing'>
	^self states 
	    at: aWidget 
	    ifAbsent: [nil]
    ]

    states [
	<category: 'accessing'>
	^states ifNil: [states := Dictionary new]
    ]

    setStates: aDictionary [
	<category: 'accessing'>
	states := aDictionary
    ]

    widgets [
	<category: 'accessing'>
	^self states keys
    ]

    register: aWidget [
	<category: 'states'>
	self states at: aWidget put: aWidget state
    ]

    unregister: aWidget [
	<category: 'states'>
	self states
	    removeKey: aWidget
	    ifAbsent: [nil]
    ]

    unregisterAllWidgets [
	<category: 'states'>
	states := nil
    ]

    dirtyWidgets [
	"Answer all widgets which state has changed"
	<category: 'states'>

	^self widgets select: [:each |
	    self isWidgetDirty: each]
    ]

    isWidgetDirty: aWidget [
	<category: 'testing'>
	(aWidget owner notNil and: [self isWidgetDirty: aWidget owner]) ifTrue: [^false].
	^(self stateAt: aWidget) ~= aWidget state
    ]
]
