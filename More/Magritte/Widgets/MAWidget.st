"======================================================================
|
|   Magritte.MAWidget class definition
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



Iliad.Widget subclass: MAWidget [
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Widgets'>

    MAWidget class >> description [
	<category: 'accessing'>
	^MADescriptionBuilder for: self
    ]

    MAWidget class >> isAbstract [
	<category: 'testing'>
	^true
    ]

    MAWidget class >> new [
	"Create a new instance of the receiving widget class and checks if it is not abstract."

	<category: 'instance creation'>
	self isAbstract ifTrue: [self error: self name , ' is abstract.'].
	^super new
    ]

    MAWidget class >> withAllConcreteClasses [
	<category: 'reflection'>
	^Array streamContents: 
		[:stream | 
		self withAllConcreteClassesDo: [:each | stream nextPut: each]]
    ]

    MAWidget class >> withAllConcreteClassesDo: aBlock [
	<category: 'reflection'>
	self 
	    withAllSubclassesDo: [:each | each isAbstract ifFalse: [aBlock value: each]]
    ]

    isMultipart [
	<category: 'testing'>
	^self children contains: [:each | each isMultipart]
    ]

    children [
	<category: 'accessing'>
	^#()
    ]
]

