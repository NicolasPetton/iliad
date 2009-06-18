"======================================================================
|
|   Magritte.MAMultipleSelectionWidget class definition
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



MAOptionWidget subclass: MAMultipleSelectionWidget [
    
    <comment: 'I provide basic functionalities for MACheckboxGroupWidget.'>
    <category: 'Iliad-More-Magritte-Widgets'>

    add: anObject [
	<category: 'actions'>
	(self isDistinct and: [self value includes: anObject]) 
	    ifFalse: [self value: (self value copyWith: anObject)]
    ]

    clear [
	<category: 'actions'>
	self value: self value copyEmpty
    ]

    remove: anObject [
	<category: 'actions'>
	self value: (self isDistinct 
		    ifTrue: [self value copyWithout: anObject]
		    ifFalse: [self value copyWithoutFirst: anObject])
    ]

    availableList [
	<category: 'accessing'>
	^self description allOptions
    ]

    selectedList [
	<category: 'accessing'>
	^self value
    ]

    value [
	<category: 'accessing'>
	^super value ifNil: 
		[self value: Array new.
		super value]
    ]

    hasLabelId [
	<category: 'testing'>
	^true
    ]

    isDistinct [
	<category: 'testing'>
	^self description isDistinct
    ]

    isOrdered [
	<category: 'testing'>
	^self description isOrdered and: 
		[(self value respondsTo: #moveUp:) and: [self value respondsTo: #moveDown:]]
    ]

    viewerContents [
	<category: 'building'>
	^[:e | 
	    | list |
	    list := e unorderedList.
	    self selectedList do: 
		[:each | 
		(list listItem)
		    id: self labelId;
		    text: (self labelForOption: each)]]
    ]
]

