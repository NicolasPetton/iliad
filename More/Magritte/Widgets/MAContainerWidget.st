"======================================================================
|
|   Magritte.MAContainerWidget class definition
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




MADescriptionWidget subclass: MAContainerWidget [
    | errors children readonly |
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Widgets'>

    MAContainerWidget class >> isAbstract [
	<category: 'testing'>
	^false
    ]

    addForm [
	<category: 'decorating'>
	self addForm: #(#save #cancel)
    ]

    addForm: aCollection [
	<category: 'decorating'>
	self decorateWith: (MAFormDecorator buttons: aCollection)
    ]

    addSwitch [
	<category: 'decorating'>
	self decorateWith: MASwitchDecorator new.
	self readonly: true
    ]

    addValidatedForm [
	<category: 'decorating'>
	self
	    addForm;
	    addValidation
    ]

    addValidatedForm: aCollection [
	<category: 'decorating'>
	self
	    addForm: aCollection;
	    addValidation
    ]

    addValidatedSwitch [
	<category: 'decorating'>
	self
	    addSwitch;
	    addValidation
    ]

    addValidation [
	<category: 'decorating'>
	self decorateWith: MAValidationDecorator new
    ]

    buildChildren [
	<category: 'private'>
	^self description inject: Dictionary new
	    into: 
		[:result :each | 
		each isVisible 
		    ifTrue: 
			[result at: each
			    put: (each widgetClass 
				    memento: self memento
				    description: each
				    parent: self)].
		result]
    ]

    doValidate [
	<category: 'private'>
	self memento validate.
	self children do: [:each | each doValidate]
    ]

    withContainersDo: aBlock [
	"This does a depth first search through all children and
	evaluates a block for all container widgets that have their
	own memento."
	<category: 'private'>
	
	self withContainersDo: aBlock in: self
    ]

    withContainersDo: aBlock in: aWidget [
	"This does a depth first search through all children and
	evaluates a block for all container widgets that have their
	own memento."
	<category: 'private'>
	
	aWidget children do: [:each | self withContainersDo: aBlock in: each].
	aWidget isMagritteContainer ifTrue: [aBlock value: aWidget]
    ]

    cancel [
	<category: 'actions'>
	self
	    reset;
	    answer: nil
    ]

    commit [
	<category: 'actions'>
	self
	    withContainersDo: [:each | each memento commit];
	    markDirty
    ]

    edit [
	<category: 'actions'>
	self readonly: false.
	self markDirty
    ]

    reset [
	<category: 'actions'>
	self withContainersDo: [:each | each memento reset].
	self markDirty
    ]

    save [
	<category: 'actions'>
	self validate ifFalse: [^self markDirty].
	self
	    commit;
	    answer: self model
    ]

    validate [
	<category: 'actions'>
	errors := OrderedCollection new.
	[self withContainersDo: [:each | each doValidate]] on: MAError
	    do: 
		[:error | 
		errors add: error.
		error isResumable ifTrue: [error resume]].
	^errors isEmpty
    ]

    childAt: aDescription [
	<category: 'accessing'>
	^children at: aDescription ifAbsent: [nil]
    ]

    children [
	<category: 'accessing'>
	^children values
    ]

    errors [
	"Answer a collection of exceptions, the list of standing errors."
	<category: 'accessing'>
	
	^errors
    ]

    contents [
	<category: 'building'>
	^[:e | self description widgetBuilder widget: self on: e]
    ]

    initialize [
	<category: 'initialize-release'>
	super initialize.
	errors := OrderedCollection new
    ]

    setChildren: aDictionary [
	<category: 'initialize-release'>
	children := aDictionary
    ]

    setDescription: aDescription [
	<category: 'initialize-release'>
	super setDescription: aDescription.
	self setChildren: self buildChildren
    ]

    isMagritteContainer [
	<category: 'testing'>
	^true
    ]

    isReadonly [
	<category: 'testing'>
	^super isReadonly or: [self readonly]
    ]

    readonly [
	<category: 'accessing-properties'>
	^readonly ifNil: [readonly := false]
    ]

    readonly: aBoolean [
	<category: 'accessing-properties'>
	readonly := aBoolean
    ]
]

