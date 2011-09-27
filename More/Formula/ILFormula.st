"======================================================================
|
|   Iliad.ILFormula class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
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



ILWidget subclass: ILFormula [
    | proxy conditions containers formulas buttons saveAction cancelAction errors multipart subFormula |
	
    <category: 'Iliad-More-Formula'>
    <comment: nil>

    ILFormula class >> on: anObject [
	<category: 'instance creation'>
	^self new
	    setModel: anObject;
	    yourself
    ]

    postCopy [
	<category: 'copying'>
	super postCopy.
	containers := self containers collect: [:each | 
	    each copy postCopyTo: self; yourself]
    ]

    model [
	<category: 'accessing'>
	^proxy model
    ]

    proxy [
	<category: 'accessing'>
	^proxy
    ]

    conditions [
	<category: 'accessing'>
	^conditions ifNil: [conditions := OrderedCollection new]
    ]

    errors [
	<category: 'accessing'>
	^errors ifNil: [errors := OrderedCollection new]
    ]

    addCondition: aCondition [
	<category: 'accessing'>
	self conditions add: aCondition
    ]

    addCondition: aBlock labelled: anotherBlock [
	<category: 'conditions'>
	self addCondition: (ILCondition new
	    conditionBlock: aBlock;
	    labelBlock: anotherBlock;
	    yourself)
    ]

    containers [
	<category: 'accessing'>
	^containers ifNil: [containers := OrderedCollection new]
    ]

    formulas [
	<category: 'accessing'>
	^formulas ifNil: [formulas := OrderedCollection new]
    ]

    formulas: aCollection [
	<category: 'accessing'>
	formulas := aCollection
    ]

    newContainer [
	<category: 'accessing'>
	^self newContainerLabelled: ''
    ]

    newContainerLabelled: aString [
	<category: 'accessing'>
	^self containers add: (ILFieldContainer on: self label: aString)
    ]

    fields [
	<category: 'accessing'>
	| fields |
	fields := OrderedCollection new.
	self containers do: [:each | fields addAll: each fields].
	self formulas do: [:each | fields addAll: each fields].
	^fields
    ]

    buttons [
	<category: 'accessing'>
	^buttons ifNil: [self defaultButtons]
    ]
    
    buttons: aCollection [
	<category: 'accessing'>
	buttons := aCollection
    ]

    saveAction [
	<category: 'accessing'>
	^saveAction ifNil: [self defaultSaveAction]
    ]

    saveAction: aBlock [
	<category: 'accessing'>
	saveAction := aBlock
    ]
 
    cancelAction [
	<category: 'accessing'>
	^cancelAction ifNil: [self defaultCancelAction]
    ]

    cancelAction: aBlock [
	<category: 'accessing'>
	cancelAction := aBlock
    ]

    beMultipart [
	<category: 'accessing'>
	multipart := true
    ]

    multipart [
	<category: 'accessing'>
	^multipart ifNil: [false]
    ]

    beSubFormula [
	<category: 'accessing'>
	subFormula := true
    ]

    subFormula [
	<category: 'accessing'>
	^subFormula ifNil: [false]
    ]

    defaultButtons [
	<category: 'defaults'>
	^{'Save' -> #save. 'Cancel' -> #cancel}
    ]

    defaultSaveAction [
	<category: 'defaults'>
	^[:model | self commit. self answer: self model]
    ]

    defaultCancelAction [
	<category: 'defaults'>
	^[:model | self answer: nil]
    ]

    addField: aField [
	<category: 'adding'>
	| container |
	container := self containers isEmpty 
	    ifTrue: [
		self newContainer]
	    ifFalse: [
		self containers last].
	^container addField: aField
    ]

    addFormula: aFormula [
	<category: 'adding'>
	aFormula beSubFormula.
	^self formulas add: aFormula
    ]

    inputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILInputField on: self selector: aSelector)
    ]

    textareaOn: aSelector [
	<category: 'adding'>
	^self addField: (ILTextareaField on: self selector: aSelector)
    ]

    checkboxOn: aSelector [
	<category: 'adding'>
	^self addField: (ILCheckboxField on: self selector: aSelector)
    ]

    passwordOn: aSelector [
	<category: 'adding'>
	^self addField: (ILPasswordField on: self selector: aSelector)
    ]

    dateInputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILDateInputField on: self selector: aSelector)
    ]

    numberInputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILNumberInputField on: self selector: aSelector)
    ]

    selectOn: aSelector [
	<category: 'adding'>
	^self addField: (ILSelectField on: self selector: aSelector)
    ]

    multipleCheckboxOn: aSelector [
	<category: 'adding'>
	^self addField: (ILMultipleCheckboxField on: self selector: aSelector)
    ]

    fileInputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILFileInputField on: self selector: aSelector)
    ]

    autocompleteInputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILAutocompleteInputField on: self selector: aSelector)
    ]

    do: aBlock [
	<category: 'enumerating'>
	self fields do: aBlock.
	self formulas do: aBlock
    
    ]

    collect: aBlock [
	<category: 'enumerating'>
	| copy |
	copy := self copy.
	copy containers do: [:each |
	    each setFields: (each fields collect: aBlock)].
	copy formulas: (copy formulas collect: [:each | each collect: aBlock]).
	^copy
    ]

    select: aBlock [
	<category: 'enumerating'>
	| copy |
	copy := self copy.
	copy containers do: [:each |
	    each setFields: (each fields select: aBlock)].
	copy formulas: (copy formulas collect: [:each | each select: aBlock]).
	^copy
    ]

    reject: aBlock [
	<category: 'enumerating'>
	| copy |
	copy := self copy.
	copy containers do: [:each |
	    each setFields: (each fields reject: aBlock)].
	copy formulas: (copy formulas collect: [:each | each reject: aBlock]).
	^copy
    ]

    fieldsScripts [
	<category: 'building'>
	^Array streamContents: [:str |
		self fields do: [:each |
			str nextPutAll: each scripts]]
    ]
 
    scripts [
	{'/javascripts/jquery.autocomplete.js'}
    		addAll: self fieldsScripts;
		yourself
    ]

    styles [
	<category: 'building'>
	^{'/stylesheets/jquery.autocomplete.css'}
    ]

    contents [
	<category: 'building'>
	^self isSubFormula 
	      ifFalse: [self mainFormulaContents]
	      ifTrue: [self subFormulaContents]
    ]
    
    mainFormulaContents [
	<category: 'building'>
	^[:e |
	    e div 
		class: 'formula';
		build: self errorsContents;
		build: [:div |
		    div form build: [:form |
			form multipart: self isMultipart.
			form build: self containersContents.
			form div 
			    class: 'buttons';
			    build: self buttonsContents]]]
    ]

    subFormulaContents [
	<category: 'building'>
	^self containersContents
    ]

    containersContents [
	<category: 'building'>
	^[:e |
	    self containers do: [:each |
		e build: each].
	    self formulas do: [:each |
		e build: each]]
    ]

    buttonsContents [
	<category: 'building'>
	^[:e |
	    self buttons do: [:each |
		e button
		    text: each key;
		    action: [self perform: each value]]]
    ]

    errorsContents [
	<category: 'building'>
	^[:e |
	    self errors notEmpty ifTrue: [
		e ul
		    class: 'errors';
		    build: [:ul |
			self errors do: [:each |
			    ul li text: each]]]]
	]

    save [
	<category: 'actions'>
	self 
	    validate;
	    markDirty.
	self isValid ifTrue: [
	    self saveAction cull: self model]
    ]

    cancel [
	<category: 'actions'>
	self cancelAction cull: self model
    ]

    commit [
	<category: 'actions'>
	self formulas do: [:each | each commit].
	proxy commit
    ]

    validate [
	<category: 'actions'>
	errors := OrderedCollection new.
	self fields do: [:each | each validate].
	self formulas do: [:each | each validate].
	self isValid ifTrue: [
	    self conditions do: [:each |
		(each validate: self proxy) ifFalse: [
		    self errors add: (each labelFor: self proxy)]]]
    ]

    isEmpty [
	<category: 'testing'>
	^self fields isEmpty
    ]

    isValid [
	<category: 'testing'>
	self fields do: [:each |
	    each isValid ifFalse: [^false]].
	self formulas do: [:each |
	    each isValid ifFalse: [^false]].
	^self errors isEmpty
    ]

    isMultipart [
	<category: 'testing'>
	^self multipart or: [
	    ((self fields addAll: self formulas; yourself) select: [:each | 
		each isMultipart]) notEmpty]
    ]

    isSubFormula [
	<category: 'testing'>
	^self subFormula
    ]

    setModel: anObject [
	<category: 'private'>
	proxy := ILModelProxy on: anObject
    ]
]
