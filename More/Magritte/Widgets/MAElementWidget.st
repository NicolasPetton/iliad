"======================================================================
|
|   Magritte.MAElementWidget class definition
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



MADescriptionWidget subclass: MAElementWidget [
    
    <comment: 'I provide a basic display for all subclasses of
    MAElementDescription (only for readonly descriptions).
    The object is just displayed as a string.
    For more complex behaviour, override #viewerElement. '>
    <category: 'Iliad-More-Magritte-Widgets'>

    contents [
	<category: 'building'>
	^[:e | 
	    self isReadonly 
		ifTrue: [e build: self viewerContents]
		ifFalse: [e build: self editorContents]]
    ]

    editorContents [
	<category: 'building'>
	^self viewerContents
    ]

    viewerContents [
	<category: 'building'>
	^[:e | 
	    e text: self string]
    ]

    hasLabelId [
	"Return whether somewhere an element is rendered with
	the id ==labelId== that can be reference by a <label>-tag."

	<category: 'testing'>
	^false
    ]

    reference [
	<category: 'accessing'>
	^self description reference
    ]

    string [
	<category: 'accessing-model'>
	^self value isString 
	    ifTrue: [self value]
	    ifFalse: [self description toString: self value]
    ]

    string: aString [
	<category: 'accessing-model'>
	| value |
	value := [self description fromString: aString] ifError: [aString].
	self value: value
    ]

    value [
	<category: 'accessing-model'>
	^self memento readUsing: self description
    ]

    value: anObject [
	<category: 'accessing-model'>
	self memento write: anObject using: self description
    ]

    chooser: aWidget [
	<category: 'show/answer'>
	self chooser: aWidget titled: 'Edit ' , self description label
    ]

    chooser: aWidget titled: aString [
	<category: 'show/answer'>
	self root 
	    show: (aWidget
		addMessage: [:e | e h3: aString];
		yourself)
	    onAnswer: [:ans | self value: ans]
    ]
]

