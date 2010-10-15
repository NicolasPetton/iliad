"======================================================================
|
|   Iliad.MASelectListWidget class definition
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



MASingleSelectionWidget subclass: MASelectListWidget [
    
    <comment: 'I display a simple list to allow the user to choose
    one element from the list'>
    <category: 'Iliad-More-Magritte-Widgets'>

    MASelectListWidget class >> isAbstract [
	<category: 'testing'>
	^false
    ]

    editorContents [
	<category: 'building'>
	^[:e | 
	    self description isGrouped 
		ifTrue: [e build: self editorForGroupedContents]
		ifFalse: [e build: self editorForUngroupedContents]]
    ]

    editorForUngroupedContents [
	<category: 'building'>
	^[:e | 
	    | select |
	    select := (e select)
		id: self labelId;
		yourself.
	    self options do: 
		[:each | 
		(select option)
		    selected: self value = each;
		    action: [self value: each];
		    text: (self labelForOption: each)]]
    ]

    editorForGroupedContents [
	<category: 'building-grouped'>
	^[:e | 
	    (e select)
		id: self labelId;
		build: self groupsContents]
    ]

    groupsContents [
	<category: 'building-grouped'>
	^[:e | 
	    self groups do: [:association || optgroup |
		    optgroup := e optgroup
			label: association key;
			yourself.
		association value do: [:option |
		    optgroup build: (self optionContentsFor: option)]]]
    ]

    optionContentsFor: option [
	<category: 'building-grouped'>
	^[:e | 
	    (e option)
		selected: self value = option;
		text: (self labelForOption: option);
		action: [self value: option]]
    ]

    groups [
	"The options objects are assumed to understand the 'groupBy' selector
	supplied by the description object. Keep the global ordering intact."
	<category: 'accessing-model'>

	| groups group |
	groups := OrderedCollection new.
	self options do: [:option | 
	    option isNil 
	    ifFalse: 
		[group := self description groupBy read: option.
		    (groups detect: [:each | each key = group]
			ifNone: [groups addLast: group -> OrderedCollection new]) value 
			addLast: option]].
	^groups
    ]

    hasLabelId [
	<category: 'testing'>
	^self isReadonly not
    ]
]

