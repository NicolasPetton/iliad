"======================================================================
|
|   Iliad.Tree class definition
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



UIWidget subclass: Tree [
    | item expanded childrenBlock subTrees root contentsBlock |
    
    <category: 'Iliad-More-UI'>
    <comment: 'I am a graphical tree widget.

Usage example:

Tree new
    item: Object;
    childrenBlock: [:class | class subclasses];
    contentsBlock: [:e :class | e text: class name]'>

    contents [
	<category: 'building'>
	^[:e || div |
	    div := e div.
	    self isRoot ifTrue: [
		div class: self cssClass].
	    div build: self contentsForItem]
    ]

    contentsForItem [
	<category: 'building'>
	^[:e || div |
	    div := e div class: self cssClassForItem.
	    self hasChildren ifTrue: [| arrow |
		arrow := div anchor class: 'arrow'.
		self expanded 
		    ifTrue: [
			arrow image 
			   source: '/images/arrow_down.png' 
			    alternativeText: 'collapse'.
			arrow action: [self collapse]]
		    ifFalse: [
			arrow image 
			    source: '/images/arrow_right.png' 
			    alternativeText: 'expand'.
			arrow action: [self expand]]].
	    div space.
	    self contentsBlock value: div value: self item.
	    (self hasChildren and: [self expanded]) ifTrue: [| ul |
		ul := div unorderedList.
		self subTrees do: [:each | 
		    ul listItem build: each]]]
    ]

    children [
	<category: 'accessing'>
	^self childrenBlock value: self item
    ]

    childrenBlock [
	<category: 'accessing'>
	^childrenBlock
    ]

    childrenBlock: aBlock [
	"aBlock is used to compute the children of the given argument.
	Example: [:item | item children]"
	<category: 'accessing'>

	childrenBlock := aBlock
    ]

    contentsBlock [
	<category: 'accessing'>
	^contentsBlock
    ]

    contentsBlock: aViewBlock [
	"aViewBlock takes two arguments.
	Example: [:e :item | e text: item printString]"		
	<category: 'accessing'>

	contentsBlock := aViewBlock
    ]

    cssClass [
	<category: 'accessing'>
	^super cssClass, ' tree'
    ]

    cssClassForItem [
	<category: 'accessing'>
	| str |
	str := WriteStream on: String new.
	self hasChildren ifTrue: [str nextPutAll: ' expandable'].
	self expanded ifTrue: [str nextPutAll: ' expanded'].
	^str contents
    ]

    expanded [
	<category: 'accessing'>
	^expanded ifNil: [false]
    ]

    item [
	<category: 'accessing'>
	^item
    ]

    item: anItem [
	<category: 'accessing'>
	item := anItem
    ]

    root [
	<category: 'accessing'>
	^root ifNil: [root := true]
    ]

    root: aBoolean [
	<category: 'accessing'>
	root := aBoolean
    ]

    subTrees [
	<category: 'accessing'>
	^subTrees ifNil: [
	    subTrees := self children collect: [:each | 
		self treeForChild: each]]
    ]

    treeForChild: anObject [
	<category: 'accessing'>
	^self class new
	    root: false;
	    childrenBlock: self childrenBlock;
	    item: anObject;
	    contentsBlock: self contentsBlock;
	    yourself
    ]

    collapse [
	<category: 'actions'>
	expanded := false.
	self markDirty
    ]

    expand [
	<category: 'actions'>
	expanded := true.
	self markDirty
    ]

    hasChildren [
	<category: 'testing'>
	^self children notNil and: [self children notEmpty]
    ]

    isRoot [
	<category: 'testing'>
	^self root
    ]
]

