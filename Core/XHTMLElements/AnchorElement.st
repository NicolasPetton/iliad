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

    tag [
	<category: 'accessing'>
	^'a'
    ]

    accessKey: aCharacter [
	<category: 'accessing attributes'>
	self attributeAt: 'accesskey' put: aCharacter asString
    ]

    tabIndex: anInteger [
	<category: 'accessing attributes'>
	self attributeAt: 'tabindex' put: anInteger printString
    ]

    circularShape [
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

    polygonalShape [
	<category: 'accessing attributes-imagemap'>
	self shape: 'poly'
    ]

    rectangularShape [
	<category: 'accessing attributes-imagemap'>
	self shape: 'rect'
    ]

    shape: aString [
	<category: 'accessing attributes-imagemap'>
	self attributeAt: 'shape' put: aString
    ]

    action: aBlock [
	<category: 'links'>
	| action |
	action := Action new
	    block: aBlock;
	    key: self session nextId;
	    yourself.
	self session registerAction: action.
	self href: (self session urlForAction: action).
	self onClick: ('Iliad.evaluateAnchorAction(this); return false;')
    ]
]

