"======================================================================
|
|   Magritte.MAWidgetBuilder class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
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



MAVisitor subclass: MAWidgetBuilder [
    | widget errors group element |
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Builders'>

    MAWidgetBuilder class >> widget: aWidget on: anElement [
	<category: 'instance creation'>
	^self new widget: aWidget on: anElement
    ]

    childAt: aDescription [
	<category: 'private'>
	^widget childAt: aDescription
    ]

    classFor: aDescription [
	<category: 'private'>
	| classes |
	classes := OrderedCollection withAll: aDescription cssClasses.
	aDescription isReadonly ifTrue: [classes add: 'readonly'].
	aDescription isRequired ifTrue: [classes add: 'required'].
	(self hasError: aDescription) ifTrue: [classes add: 'error'].
	^classes reduce: [:a :b | a , ' ' , b]
    ]

    widget: aWidget on: anElement [
	<category: 'visiting'>
	self
	    setWidget: aWidget;
	    setElement: anElement.
	self visit: aWidget description
    ]

    hasError: aDescription [
	<category: 'testing'>
	| current |
	errors ifNotNil: [^errors includes: aDescription].
	errors := IdentitySet new.
	current := widget.
	[current notNil] whileTrue: [
	    current isMagritteContainer ifTrue: [
		current errors do: [:each | 
		    errors add: (each tag isDescription 
			ifTrue: [each tag]
			ifFalse: [current description])]].
	    current := current parent].
	^self hasError: aDescription
    ]

    buildContainerFor: aDescription [
	<category: 'building'>
	^[:e | 
	    self visitAll: (aDescription select: [:each | 
		each isVisible and: 
		    [each widgetClass notNil]])]
    ]

    buildControlFor: aDescription [
	<category: 'building'>
	^[:e | e add: (self childAt: aDescription) build]
    ]

    buildElementFor: aDescription [
	<category: 'building'>
	^[:e | 
	    aDescription group = group ifFalse: [
		self buildGroupFor: aDescription].
	e build: (self buildLabelFor: aDescription).
	e build: (self buildControlFor: aDescription)]
    ]

    buildGroupFor: aDescription [
	<category: 'building'>
	^[:e | group := aDescription group]
    ]

    buildLabelFor: aDescription [
	<category: 'building'>
	^[:e || label |
	aDescription hasLabel ifTrue: [
	    label := e label.
	    (self childAt: aDescription) hasLabelId 
		ifTrue: [label for: (self childAt: aDescription) labelId].
	label text: aDescription label , ':']]
    ]

    setElement: anElement [
	<category: 'initialize-release'>
	element := anElement
    ]

    setWidget: aWidget [
	<category: 'initialize-release'>
	widget := aWidget
    ]

    visitContainer: aDescription [
	<category: 'visiting-description'>
	element build: (self buildContainerFor: aDescription)
    ]

    visitElementDescription: aDescription [
	<category: 'visiting-description'>
	element build: (self buildElementFor: aDescription)
    ]
]

