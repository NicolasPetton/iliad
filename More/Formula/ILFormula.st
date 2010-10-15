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
    | proxy conditions fields buttons saveAction cancelAction errors multipart |
	
    <category: 'Iliad-More-Formula'>
    <comment: nil>

    ILFormula class >> on: anObject [
	<category: 'instance creation'>
	^self new
	    setModel: anObject;
	    yourself
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

    fields [
	<category: 'accessing'>
	^fields ifNil: [fields := OrderedCollection new]
    ]

    setFields: aCollection [
	<category: 'accessing'>
	fields := aCollection
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
	^self fields add: aField
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
	^self fields do: aBlock
    
    ]

    collect: aBlock [
	<category: 'enumerating'>
	^self copy
	    setFields: (self fields collect: aBlock);
	    yourself
    ]

    select: aBlock [
	<category: 'enumerating'>
	^self copy
	    setFields: (self fields select: aBlock);
	    yourself
    ]

    reject: aBlock [
	<category: 'enumerating'>
	^self copy
	    setFields: (self fields reject: aBlock);
	    yourself
    
    ]

    scripts [
	<category: 'building'>
	^{'/javascripts/jquery.autocomplete.js'}
    ]

    styles [
	<category: 'building'>
	^{'/stylesheets/jquery.autocomplete.css'}
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e div 
		class: 'formula';
		build: self errorsContents;
		build: [:div |
		    div form build: [:form |
			form multipart: self isMultipart.
			form 
			    div
				class: 'fields';
				build: [:div2 |
				    div2 table tbody build: self tableContents].
			form div 
			    class: 'buttons';
			    build: self buttonsContents]]]
    ]

    tableContents [
	<category: 'building'>
	^[:tbody |
	    self fields do: [:each |
		tbody build: each]]
    ]

    buttonsContents [
	<category: 'building'>
	^[:form |
	    self buttons do: [:each |
		form button
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
	proxy commit
    ]

    validate [
	<category: 'actions'>
	errors := OrderedCollection new.
	self fields do: [:each | each validate].
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
	^self errors isEmpty
    ]

    isMultipart [
	<category: 'testing'>
	^self multipart or: [
	    (self fields select: [:each | each isMultipart]) notEmpty]
    ]

    setModel: anObject [
	<category: 'private'>
	proxy := ILModelProxy on: anObject
    ]
]
