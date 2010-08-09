"======================================================================
|
|   Iliad.ILWidget class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Some parts of this file reuse code from the Seaside framework written 
| by Avi Bryant, Julian Fitzell, Lukas Renggli, Michel Bany, Philippe
| Marschall and Seaside contributors http://www.seaside.st 
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



ILBuildable subclass: ILWidget [
    | id state decorator owner dependentWidgets |

    <category: 'Iliad-Core-Buildables'>
    <comment: 'I am a stateful graphical component. 


""""""""""""""""""""""""""""""
" Building HTML with widgets "
""""""""""""""""""""""""""""""

To build HTML override the #contents method, which should always 
return a view block, ie, a block which takes an element as parameter.

Example: 

contents 
    ^[:e || div |
        div := e div class: ''foo''.
        div h1: ''Bar''.
        div a
            text: ''do something'';
            action: [self doSomething]]


See Iliad.ILElement hierarchy (Especially Iliad.ILHTMLBuilderElement ) for more information 
about building HTML with elements.

#contents method should *never* be called from the outside. Use #build instead. 
For instance, to build a sub-widget in a view block, you should write something like:

contents [
    ^[:e | e build: mySubWidget]
]


""""""""""""""""
" Control flow "
""""""""""""""""

I can show (display instead of me) other widgets with #show* methods or answer 
to widgets that called me with #answer. 

When using the javascript layer, call #markDirty whenever my state change,
so I will be updated on AJAX requests.

Widgets which states depend on me can be automatically rebuilt whenever I am
marked as dirty (see #addDependentWidget:).


""""""""""""""
" Decorators "
""""""""""""""

I can also have decorators that may modify my behavior. A decorator can be 
added to the decoration chain with #decorateWith:.'>

    initialize [
	<category: 'initialization'>
	super initialize.
	decorator := ILDecorator decoratee: self.
	dependentWidgets := OrderedCollection new.
    ]

    postCopy [
	<category: 'copying'>
	super postCopy.
	decorator := ILDecorator decoratee: self.
	dependentWidgets := OrderedCollection new.
	state := nil.
	id := nil
    ]

    state [
	<category: 'accessing'>
	^state copy
    ]

    id: aString [
	<category: 'accessing'>
	id := aString
    ]

    id [
	<category: 'accessing'>
	^id ifNil: [id := self session nextId]
    ]
 
    owner: aWidget [
	<category: 'accessing'>
	owner := aWidget
    ]

    owner [
	"Return the widget which shows me. if any"
	<category: 'accessing'>

	^owner
    ]

    dependentWidgets [
	<category: 'accessing'>
	^dependentWidgets copy
    ]
    
    widget [
	<category: 'accessing'>
	^self
    ]

    widgetFor: aBuildable [
	"Convenience method. This is useful for building anonymous widgets.
	ex: myWidget := self widgetFor: [:e | e h1: 'Hello world!']"
	<category: 'accessing'>

	^ILPluggableWidget new 
	    contentsBlock: aBuildable; 
	    yourself
    ]

    stateRegistry [
	<category: 'accessing'>
	^self context stateRegistry
    ]

    build [
	"Do *not* override this method. Use #contents instead"
	<category: 'building'>

	self registerState.
	self context addBuiltWidget: self.
	
	^self newRootElement
	    class: self id;
	    build: self fullContents;
	    yourself
    ]

    fullContents [
	"Do *not* override this method. Use #contents instead"
	<category: 'building'>
	^decorator contents
    ]

    buildHead: aHead [
	<category: 'building'>
	decorator updateHead: aHead
    ]

    contents [
	"Override this method to add contents to your widget"
	<category: 'building'>

	^[:e | ]
    ]

    scripts [
	"Answer a collection of strings.
	Override in subclasses to add scripts to load with the widget"
	<category: 'building'>

	^#()
    ]

    styles [
	"Answer a collection of strings.
	Override in subclasses to add styles to load with the widget"
	<category: 'building'>

	^#()
    ]

    decorateWith: aDecorator [
	<category: 'decorators'>
	| dec1 dec2 |
	dec1 := nil.
	dec2 := decorator.
	[dec2 = self or: [
	    aDecorator isGlobal]] whileFalse: [
		    dec1 := dec2.
		    dec2 := dec2 decoratee].
	aDecorator decoratee: dec2.
	dec1 isNil 
	    ifTrue: [decorator := aDecorator]
	    ifFalse: [dec1 decoratee: aDecorator]
    ]

    decorateWith: aDecorator during: aBlock [
	<category: 'decorators'>
	self decorateWith: aDecorator.
	aBlock value.
	aDecorator removeYourself
    ]

    decoratorsDo: aBlock [
	<category: 'decorators'>
	| dec |
	dec := decorator.
	[dec ~= self] whileTrue: [
	    aBlock value: dec.
	    dec := dec decoratee]
    ]

    withDecoratorsDo: aBlock [
	<category: 'decorators'>
	aBlock value: self.
	self decoratorsDo: aBlock
    ]

    removeDecorator: aDecorator [
	"Remove <aDecorator> from the decoration chain,
	except if <aDecorator> is the initial one"
	<category: 'decorators'>

	decorator = aDecorator 
	    ifTrue: [
		decorator decoratee = self ifFalse: [
		    decorator := aDecorator decoratee]]
	    ifFalse: [| dec1 dec2 |
		dec1 := decorator.
		[dec1 = aDecorator] whileFalse: [
		    dec2 := dec1.
		    dec1 := dec1 decoratee].
		dec2 decoratee: dec1 decoratee]
    ]

    rootElementClass [
	<category: 'defaults'>
	^ILDivElement
    ]
    
    answer [
	"Give the control back to the owner, i.e, the widget which showed the receiver.
	 Answer self"
	<category: 'control flow'>
	
	^self answer: self
    ]
    
    answer: anAnswer [
	"Give the control back to the owner, i.e, the widget which showed the receiver.
	Answer <anAnswer>"
	<category: 'control flow'>

	 decorator handleAnswer: anAnswer
    ]
    
    handleAnswer: anAnswer [
	<category: 'control flow'>
	^nil
    ]

    retrieveControl [
	"Give the control back to the receiver, and make any showed widget answer nil"
	<category: 'control flow'>

	self decoratorsDo: [:each |
	    each isDelegator ifTrue: [
		each widget answer: nil]]
    ]

    show: aWidget [
	"Show another widget instead of the receiver.
	The receiver is also implicitely marked dirty"
	<category: 'control flow'>

	self show: aWidget onAnswer: [:ans | ]
    ]

    show: aWidget onAnswer: aBlock [
	"Show another widget instead of the receiver and catch the answer in <aBlock>.
	The receiver is also implicitely marked dirty"
	<category: 'control flow'>

	self
	    show: aWidget
	    onAnswer: aBlock
	    delegator: (ILDelegator new widget: aWidget)
    ]
    
    append: aWidget [
	"Insert <aWidget> after the receiver"
	<category: 'control flow'>

	self append: aWidget onAnswer: [:ans |]
    ] 

    append: aWidget onAnswer: aBlock [
	"Insert <aWidget> after the receiver"
	<category: 'control flow'>

	self 
	    show: aWidget
	    onAnswer: aBlock
	    delegator: (ILAppendDelegator new widget: aWidget)
    ]

    prepend: aWidget [
	"Insert <aWidget> before the receiver"
	<category: 'control flow'>

	self prepend: aWidget onAnswer: [:ans |]
    ] 

    prepend: aWidget onAnswer: aBlock [
	"Insert <aWidget> before the receiver"
	<category: 'control flow'>

	self 
	    show: aWidget
	    onAnswer: aBlock
	    delegator: (ILPrependDelegator new widget: aWidget)
    ]

    show: aWidget onAnswer: aBlock delegator: aDelegator  [ 
	<category: 'control flow'>
	| answerHandler |
	answerHandler := ILAnswerHandler new.
	self 
	    decorateWith: aDelegator;
	    markDirty.
	answerHandler action: (self session actionFor: [:value |
		aDelegator removeYourself.
		self markDirty.
		aWidget owner: nil.
		answerHandler removeYourself.
		aBlock value: value]).
	aWidget
	    owner: self;
	    decorateWith: answerHandler
    ]

    inform: aString [
	<category: 'control flow'>
	self show: (ILInformationWidget new
	    informationString: aString;
	    yourself)
    ]

    confirm: aString ifTrue: aBlock [
	<category: 'control flow'>
	self 
	    confirm: aString 
	    ifTrue: aBlock 
	    ifFalse: []
    ]

    confirm: aString ifTrue: aBlock ifFalse: anotherBlock [
	<category: 'control flow'>
	self
	    show: (ILConfirmationWidget new
		confirmationString: aString;
		yourself)
	    onAnswer: [:boolean |
		boolean ifTrue: aBlock ifFalse: anotherBlock]
    ]

    addDependentWidget: aWidget [
	"Add <aWidget> to my dependent widgets.
	Each dependent widget will be rebuilt on AJAX requests whenever
	I am rebuilt"
	<category: 'control flow'>

	(dependentWidgets includes: aWidget) ifFalse: [
	    dependentWidgets add: aWidget]
    ]

    removeDependentWidget: aWidget [
	<category: 'control flow'>
	(dependentWidgets includes: aWidget) ifTrue: [
	    dependentWidgets remove: aWidget]
    ]
 
    registerState [
	<category: 'states'>
	self stateRegistry register: self
    ]

    markDirty [
	"Mark the receiver as 'dirty', 
	 so the widget will be rebuilt on Ajax requests.
	 You do not need to mark subwidgets as dirty, 
	 they will be rebuilt together with the receiver"
	<category: 'states'>
	
	self beDirty.
	dependentWidgets do: [:each | each markDirty]
    ]

    printJsonOn: aStream [
	<category: 'printing'>
	self build printJsonOn: aStream
    ]

    newRootElement [
	<category: 'private'>
	^self rootElementClass new
    ]

    updateHead: aHead [
	<category: 'private'>
	self withDecoratorsDo: [:each |
	    each scripts do: [:script || e |
		e := ILHTMLBuilderElement new javascript src: script.
		(aHead children includes: e) ifFalse: [
		    aHead add: e]].
	    each styles do: [:script || e |
		e := ILHTMLBuilderElement new stylesheet href: script.
		(aHead children includes: e) ifFalse: [
		    aHead add: e]]]
    ]

    beDirty [
	<category: 'private'>
	
	state := self session nextId
    ]
]
