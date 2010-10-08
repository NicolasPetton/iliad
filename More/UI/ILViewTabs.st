"======================================================================
|
|   Iliad.ILViewTabs class definition
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




ILUIWidget subclass: ILViewTabs [
    | views labels selectedView |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    contents [
	<category: 'building'>
	^[:e || ul div |
	    div := e div class: self cssClass.
	    ul := div ul.
	    self views do: [:each || li |
		li := ul li.
		li a
		    text: (self labelFor: each);
		    linkToLocal: each.
		self selectedView = each ifTrue: [
		    li class: 'selected']]]
    ]

    cssClass [
	<category: 'accessing'>
	^super cssClass, ' tabs'
    ]

    labelFor: aView [
	<category: 'accessing'>
	^self labels at: (self views indexOf: aView)
    ]

    labels [
	<category: 'accessing'>
	^labels
    ]

    labels: aCollection [
	"aCollection of strings.
	 aCollection must have the same size as widgets collection"

	<category: 'accessing'>
	labels := aCollection
    ]

    selectedView [
	<category: 'accessing'>
	| route |
	route := self router route copy.
	route position: self application originalRoutePosition.
	^route next ifNil: [self views first]
    ]

    views [
	<category: 'accessing'>
	^views
    ]

    views: aCollection [
	"aCollection of strings to be displayed in the tabs.
	 Each view has an associated label, set with #labels: method"

	<category: 'accessing'>
	views := aCollection
    ]
]

