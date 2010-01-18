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
    | model fields buttons |
	
    <category: 'Iliad-More-Formula'>
    <comment: nil>

    ILFormula class >> on: anObject [
	<category: 'instance creation'>
	^self new
	    setModel: anObject;
	    yourself
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

    defaultButtons [
	<category: 'defaults'>
	^{'Save' -> #save. 'Cancel' -> #cancel}
    ]

    addField: aField [
	<category: 'adding'>
	^self fields add: aField
    ]

    inputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILInputField on: aSelector of: model)
    ]

    textareaOn: aSelector [
	<category: 'adding'>
	^self addField: (ILTextareaField on: aSelector of: model)
    ]

    checkboxOn: aSelector [
	<category: 'adding'>
	^self addField: (ILCheckboxField on: aSelector of: model)
    ]

    passwordOn: aSelector [
	<category: 'adding'>
	^self addField: (ILPasswordField on: aSelector of: model)
    ]

    dateInputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILDateInputField on: aSelector of: model)
    ]

    selectOn: aSelector [
	<category: 'adding'>
	^self addField: (ILSelectField on: aSelector of: model)
    ]

    fileInputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILFileInputField on: aSelector of: model)
    ]

    autocompleteInputOn: aSelector [
	<category: 'adding'>
	^self addField: (ILAutocompleteInputField on: aSelector of: model)
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
	    (e div class: 'formula')
		form build: [:form |
		    form multipart: self isMultipart.
		    form table tbody build: self tableContents.
		    form div 
			class: 'buttons';
			build: self buttonsContents]]
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

    save [
	<category: 'actions'>
	self 
	    validate;
	    markDirty.
	self isValid ifTrue: [
	    self commit; answer: model]
    ]

    cancel [
	<category: 'actions'>
	self answer: nil
    ]

    commit [
	<category: 'actions'>
	self fields do: [:each |
	    each commit]
    ]

    validate [
	<category: 'actions'>
	self fields do: [:each | each validate]
    ]

    isEmpty [
	<category: 'testing'>
	^self fields isEmpty
    ]

    isValid [
	<category: 'testing'>
	self fields do: [:each |
	    each isValid ifFalse: [^false]].
	^true
    ]

    isMultipart [
	<category: 'testing'>
	^(self fields select: [:each | each isMultipart]) notEmpty
    ]

    setModel: anObject [
	<category: 'private'>
	model := anObject
    ]
]
