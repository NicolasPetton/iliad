"======================================================================
|
|   Iliad.ILWidgetTabs class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2010 
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


ILUIWidget subclass: ILWidgetTabs [
    | contentsBlock labelBlock items selectedItem hashBlock |
    
    <comment: ''>
    <category: 'Iliad-More-UI'>

    contents [
	<category: 'building'>
	^[:e | 
	    e build: self tabsContents.
	    self contentsBlock value: e value: self selectedItem]
    ]

    tabsContents [
	<category: 'building'>
	^[:e || ul div |
	    div := e div class: self cssClass.
	    ul := div ul.
	    self items do: [:each || li |
		li := ul li.
		li a
		    text: (self labelBlock value: each);
		    action: [self selectItem: each]
		    hash: (self hashBlock value: each).
		self selectedItem = each ifTrue: [
		    li class: 'selected']]]
    ]

    cssClass [
	<category: 'accessing'>
	^super cssClass, ' tabs'
    ]

    contentsBlock [
	<category: 'accessing'>
	^contentsBlock
    ]

    contentsBlock: aViewBlock [
	<category: 'accessing'>
	contentsBlock := aViewBlock
    ]

    hashBlock [
	<category: 'accessing'>
	^hashBlock ifNil: [[:item | '']]
    ]

    hashBlock: aBlock [
	<category: 'accessing'>
	hashBlock := aBlock
    ]

    items [
	<category: 'accessing'>
	^items
    ]

    items: aCollection [
	<category: 'accessing'>
	items := aCollection
    ]

    labelBlock [
	<category: 'accessing'>
	^labelBlock
    ]

    labelBlock: aBlock [
	<category: 'accessing'>
	labelBlock := aBlock
    ]

    selectedItem [
	<category: 'accessing'>
	^selectedItem ifNil: [self items first]
    ]

    selectedItem: anItem [
	<category: 'accessing'>
	selectedItem := anItem
    ]

    selectItem: anItem [
	<category: 'actions'>
	self selectedItem: anItem.
	self markDirty
    ]

    updateFromHash: aString [
	<category: 'updating'>
	self items do: [:each | 
	    (self hashBlock value: each) = aString ifTrue: [
		self selectedItem: each.
		^self]]
    ]
]

