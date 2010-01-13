"======================================================================
|
|   Magritte.MASelectionColumnWidget class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from Magritte-Seaside written by Lukas Renggli 
| http://source.lukas-renggli.ch/magritte.
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



MAActionColumnWidget subclass: MASelectionColumnWidget [
    | selection |
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Report'>

    buildCellLinkContent: anObject [
	<category: 'building'>
	| selected |
	selected := self isSelected: anObject.
	^[:e | 
	    e a
		class: (selected isNil ifFalse: ['selected']);
		action: [self selectRow: anObject value: selected not];
		build: (selected 
		    ifTrue: [self stringSelected]
		    ifFalse: [self stringDeselected])]
    ]

    defaultSelection [
	<category: 'accessing-defaults'>
	self subclassResponsibility
    ]

    defaultStringDeselected [
	<category: 'accessing-defaults'>
	self subclassResponsibility
    ]

    defaultStringSelected [
	<category: 'accessing-defaults'>
	self subclassResponsibility
    ]

    deselectRow: anObject [
	<category: 'actions'>
	self subclassResponsibility
    ]

    refresh [
	<category: 'actions'>
	super refresh.
	self selection: self defaultSelection
    ]

    selectRow: anObject [
	<category: 'actions'>
	self subclassResponsibility
    ]

    selectRow: anObject value: aBoolean [
	<category: 'actions'>
	aBoolean 
	    ifTrue: [self selectRow: anObject]
	    ifFalse: [self deselectRow: anObject]
    ]

    isSelected: anObject [
	<category: 'testing'>
	self subclassResponsibility
    ]

    selection [
	<category: 'accessing'>
	selection isNil ifTrue: [self selection: self defaultSelection].
	^selection
    ]

    selection: anObject [
	<category: 'accessing'>
	selection := anObject
    ]

    stringDeselected [
	<category: 'accessing-settings'>
	^self propertyAt: #stringDeselected
	    ifAbsent: [self defaultStringDeselected]
    ]

    stringDeselected: aString [
	<category: 'accessing-settings'>
	^self propertyAt: #stringDeselected put: aString
    ]

    stringSelected [
	<category: 'accessing-settings'>
	^self propertyAt: #stringSelected ifAbsent: [self defaultStringSelected]
    ]

    stringSelected: aString [
	<category: 'accessing-settings'>
	^self propertyAt: #stringSelected put: aString
    ]

    webdings: aString [
	<category: 'private'>
	^[:e | e span
	    style: 'font-family: Webdings';
	    text: aString]
    ]
]

