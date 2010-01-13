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
    | id decorator owner dependentWidgets |

    <category: 'Iliad-Core-Buildables'>
    <comment: 'I am a stateful graphical component. 

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


See Iliad.ILElement hierarchy for more information about building HTML with elements.

#contents method should *never* be called from the outside. Use #build instead. 
For instance, to build a sub-widget in a view block, you should write something like:

contents [
    ^[:e | e build: mySubWidget]
]

I can show (display instead of me) other widgets with #show* methods or answer 
to widgets that called me with #answer. 

When using the javascript layer, call #markDirty whenever my state change,
so I will be updated on AJAX requests.

I can also have decorators that may modify my behavior. A decorator can be 
added to the decoration chain with #decorateWith:.'>

    initialize [
	<category: 'initialize-release'>
	super initialize.
	decorator := ILDecorator decoratee: self.
	dependentWidgets := OrderedCollection new
    ]

    id: aString [
	<category: 'accessing'>
	id := aString
    ]

    id [
	<category: 'accessing'>
	^id ifNil: [id := ILId new]
    ]
 
    owner: aWidget [
	<category: 'accessing'>
	owner := aWidget
    ]

    owner [
	"Return the widget which show me. if any"
	<category: 'accessing'>

	^owner
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

    buildContents [
	"Do *not* override this method. Use #contents instead"
	<category: 'building'>

	self buildHead: self application page head.	
	
	^self newRootElement div 
	    class: '_widget ', self id;
	    build: decorator contents;
	    yourself
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

    defaultRootElementClass [
	<category: 'defaults'>
	^ILXHTMLElement
    ]
    
    answer [
	"Give the control back to the owner, i.e, the widget which showed me.
	 Answer self"
	<category: 'control flow'>
	
	^self answer: self
    ]
    
    answer: anAnswer [
	"Give the control back to the owner, i.e, the widget which showed me.
	Answer <anAnswer>"
	<category: 'control flow'>

	 decorator handleAnswer: anAnswer
    ]
    
    handleAnswer: anAnswer [
	<category: 'control flow'>
	^nil
    ]
  
    retrieveControl [
	"Get the control back to the receiver from any showed widget, and make it answer nil"
	<category: 'control flow'>

	self decoratorsDo: [:each |
	    each isDelegator ifTrue: [
		each widget answer: nil]]
    ]

    show: aWidget [
	"Show another widget instead of the receiver.
	I am also implicitely marked dirty"
	<category: 'control flow'>

	self show: aWidget onAnswer: [:ans | ]
    ]

    show: aWidget onAnswer: aBlock [
	"Show another widget instead of the receiver and catch the answer in <aBlock>.
	I am also implicitely marked dirty"
	<category: 'control flow'>
	
	self
	    show: aWidget
	    onAnswer: aBlock
	    delegator: (ILDelegator new widget: aWidget)
    ]
    
    show: aWidget onAnswer: aBlock delegator: aDelegator  [ 
	<category: 'control flow'>
	| answerHandler |
	self retrieveControl.
	answerHandler := ILAnswerHandler new.
	self decorateWith: aDelegator.
	answerHandler action: (ILAction new block: [:value |
	    aDelegator removeYourself.
	    self markDirty.
	    aWidget owner: nil.
	    answerHandler removeYourself.
	    aBlock value: value]).
	aWidget
	    owner: self;
	    markDirty;
	    decorateWith: answerHandler
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
	    delegator: (ILAppendDecorator new widget: aWidget)
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
	    delegator: (ILPrependDecorator new widget: aWidget)
    ]

    printJsonOn: aStream [
	<category:'printing'>
	self build printJsonOn: aStream
    ]

    markDirty [
	"Mark the widget as 'dirty', ie, 
	 The widget will be rebuilt on Ajax requests.
	 You do not need to mark subwidgets as dirty. 
	 They will be automatically rebuilt too"
	<category: 'states'>
	
	self owner
	    ifNil: [self setDirty]
	    ifNotNil: [self owner markDirty].
	dependentWidgets do: [:each | each markDirty]
    ]
 
    setDirty [
	"You shouldn't call this method directly unless you know what you are doing."
	<category: 'states'>
	
	^self session addToDirtyWidgets: self
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

    newRootElement [
	<category: 'private'>
	^self defaultRootElementClass new
    ]

    updateHead: aHead [
	<category: 'private'>
	self withDecoratorsDo: [:each |
	    each scripts do: [:script || e |
		e := self newRootElement javascript src: script.
		(aHead children includes: e) ifFalse: [
		    aHead add: e]].
	    each styles do: [:script || e |
		e := self newRootElement stylesheet href: script.
		(aHead children includes: e) ifFalse: [
		    aHead add: e]]]
    ]
]

