"======================================================================
|
|   Iliad.AnchorElement class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
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



LinkableElement subclass: AnchorElement [

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    action: aBlock [
	<category: 'accessing'>
	self action: aBlock hash: ''
    ]

    action: aBlock hash: aString [
	<category: 'accessing'>
	
	| action |
	action := self session registerActionFor: aBlock.
	self href: (self context urlBuilder urlForAction: action).
	self onClick: ('iliad.evaluateAnchorAction(this, "', aString, '"); return false;')
    ]

    tag [
	<category: 'accessing'>
	^'a'
    ]

    accesskey: aCharacter [
	<category: 'accessing attributes'>
	self attributeAt: 'accesskey' put: aCharacter asString
    ]

    tabindex: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'tabindex' put: anInteger printString
    ]

    circleShape [
	<category: 'accessing attributes-imagemap'>
	self shape: 'circle'
    ]

    coords: aString [
	<category: 'accessing attributes-imagemap'>
	self attributeAt: 'coords' put: aString
    ]

    defaultShape [
	<category: 'accessing attributes-imagemap'>
	self shape: 'default'
    ]

    polyShape [
	<category: 'accessing attributes-imagemap'>
	self shape: 'poly'
    ]

    rectShape [
	<category: 'accessing attributes-imagemap'>
	self shape: 'rect'
    ]

    shape: aString [
	<category: 'accessing attributes-imagemap'>
	self attributeAt: 'shape' put: aString
    ]
]

