"======================================================================
|
|   Magritte.MACheckboxGroupWidget class definition
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



MAMultipleSelectionWidget subclass: MACheckboxGroupWidget [
    
    <comment: 'Use for MAMultipleSelectionWidget.
    I display as many checkboxes as my description has options.'>
    <category: 'Iliad-More-Magritte-Widgets'>

    MACheckboxGroupWidget class >> isAbstract [
	<category: 'testing'>
	^false
    ]

    editorContents [
	<category: 'building'>
	^[:e | 
	    e input 
		beHidden 
		action: [self clear].
	    self optionsWithIndexDo: [:each :index | 
		| optionId |
		optionId := self optionId: index.
		e checkbox
		    id: optionId;
		    checked: (self selectedList includes: each);
		    action: [:val | val
			ifTrue: [self add: each]
			ifFalse: [self remove: each]].
		e space.
		e label
		    for: optionId;
		    text: (self labelForOption: each)]
	    separatedBy: [e br]]
    ]

    hasLabelId [
	<category: 'testing'>
	^self isReadonly
    ]

    isDistinct [
	<category: 'testing'>
	^true
    ]

    optionId: anInteger [
	<category: 'private'>
	^self id: 'option' , anInteger printString
    ]

    optionsWithIndexDo: elementAndIndexBlock separatedBy: separatorBlock [
	<category: 'private'>
	| index |
	index := 1.
	self description allOptions do: 
		[:each | 
		elementAndIndexBlock value: each value: index.
		index := index + 1]
	    separatedBy: separatorBlock
    ]
]

