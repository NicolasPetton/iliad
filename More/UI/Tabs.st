"======================================================================
|
|   Iliad.Tabs class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2009 
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


UIWidget subclass: Tabs [
    | widgets labels selectedWidget |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    contents [
	<category: 'building'>
	^[:e || div |
	    div := e div class: self cssClass.
	    div build: self tabsContents.
	    e div
		class: 'contents';
		add: self selectedWidget build]
    ]

    tabsContents [
	<category: 'building'>
	^[:e || ul |
	    ul := e unorderedList.
	    self widgets do: [:each || li |
		li := ul listItem.
		li anchor
		    text: (self labels at: (self widgets indexOf: each));
		    action: [self selectWidget: each].
		self selectedWidget = each ifTrue: [
		    li class: 'selected']]]
    ]

    cssClass [
	<category: 'accessing'>
	^super cssClass, ' tabs'
    ]

    labels [
	<category: 'accessing'>
	^labels
    ]

    labels: aCollection [
	<category: 'accessing'>
	labels := aCollection
    ]

    selectedWidget [
	<category: 'accessing'>
	^selectedWidget ifNil: [self widgets first]
    ]

    widgets [
	<category: 'accessing'>
	^widgets
    ]

    widgets: aCollection [
	<category: 'accessing'>
	widgets := aCollection
    ]

    selectWidget: aWidget [
	<category: 'actions'>
	selectedWidget := aWidget.
	self markDirty
    ]
]

