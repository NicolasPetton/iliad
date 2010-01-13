"======================================================================
|
|   Magritte.MADescriptionWidget class definition
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



MAWidget subclass: MADescriptionWidget [
    | description memento parent |
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Widgets'>

    MADescriptionWidget class >> memento: aMemento [
	<category: 'instance creation'>
	^self memento: aMemento description: aMemento description
    ]

    MADescriptionWidget class >> memento: aMemento description: aDescription [
	<category: 'instance creation'>
	^self 
	    memento: aMemento
	    description: aDescription
	    parent: nil
    ]

    MADescriptionWidget class >> memento: aMemento description: aDescription parent: aComponent [
	<category: 'instance creation'>
	^(self new)
	    setMemento: aMemento;
	    setDescription: aDescription;
	    setParent: aComponent;
	    yourself
    ]

    description [
	<category: 'accessing'>
	^description
    ]

    labelId [
	<category: 'accessing'>
	^self id , 'label'
    ]

    memento [
	<category: 'accessing'>
	^memento
    ]

    parent [
	<category: 'accessing'>
	^parent
    ]

    doValidate [
	"Enables widgets to raise errors when the model is validated."

	<category: 'private'>
	
    ]

    id [
	<category: 'accessing-dynamic'>
	^self class name asLowercase , self hash asString
    ]

    model [
	<category: 'accessing-dynamic'>
	^self memento model
    ]

    root [
	<category: 'accessing-dynamic'>
	^self isRoot ifTrue: [self] ifFalse: [self parent root]
    ]

    isReadonly [
	<category: 'testing'>
	^self description isReadonly 
	    or: [self isRoot not and: [self parent isReadonly]]
    ]

    isRoot [
	<category: 'testing'>
	^self parent isNil
    ]

    setDescription: aDescription [
	<category: 'initialize-release'>
	description := aDescription
    ]

    setMemento: aMemento [
	<category: 'initialize-release'>
	memento := aMemento
    ]

    setParent: aComponent [
	<category: 'initialize-release'>
	parent := aComponent
    ]
]

