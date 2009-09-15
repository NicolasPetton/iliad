"======================================================================
|
|   Iliad.Widget class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
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



Buildable subclass: Widget [
    | id decorator owner |

    <category: 'Iliad-Core-Buildables'>
    <comment: 'I am a stateful graphical component. 

To build HTML override the #contents method, which should always 
return a view block, ie, a block which takes an element as parameter.

Example: 

contents 
    ^[:e || div |
        div := e div class: ''foo''.
        div h1: ''Bar''.
        div anchor
            text: ''do something'';
            action: [self doSomething]]


See Iliad.Element hierarchy for more information about building HTML with elements.

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
	decorator := Decorator decoratee: self
    ]

    id: aString [
	<category: 'accessing'>
	id := aString
    ]

    id [
	<category: 'accessing'>
	^id ifNil: [id := Id new]
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

    buildContents [
	"Do *not* override this method. Use #contents instead"
	<category: 'building'>
	
	^self newRootElement div 
	    id: self id;
	    class: '_widget';
	    build: decorator contents;
	    yourself
    ]

    contents [
	"Override this method to add contents to your widget"
	<category: 'building'>

	^[:e | ]
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

    addMessage: aString [
	<category: 'decorations'>
	self decorateWith: ((MessageDecorator decoratee: self) message: aString)
    ]

    addMessage: aString level: anInteger [
	<category: 'decorations'>
	self decorateWith: ((MessageDecorator decoratee: self)
	    message: aString;
	    level: anInteger;
	    yourself)
    ]

    decorateWith: aDecorator during: aBlock [
	<category: 'decorators'>
	self decorateWith: aDecorator.
	aBlock value.
	aDecorator removeYourself
    ]

    decorator [
	<category: 'decorators'>
	^decorator
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
	^XHTMLElement
    ]
    
    answer [
	"Give the control back to the owner, i.e, the widget which showed me.
	 Answer self"
	<category: 'show/answer'>
	
	^self answer: self
    ]
    
    answer: anAnswer [
	"Give the control back to the owner, i.e, the widget which showed me.
	Answer <anAnswer>"
	<category: 'show/answer'>

	 decorator handleAnswer: anAnswer
    ]
    
    handleAnswer: anAnswer [
	<category: 'show/answer'>
	^nil
    ]
    
    show: aWidget [
	"Show another widget instead of myself.
	I am also implicitely marked dirty"
	<category: 'show/answer'>

	self show: aWidget onAnswer: [:ans | ]
    ]

    show: aWidget onAnswer: aBlock [
	"Show another widget instead o myself, and catch the answer in <aBlock>.
	I am also implicitely marked dirty"
	<category: 'show/answer'>
	
	self
	    show: aWidget
	    onAnswer: aBlock
	    delegator: (Delegator new widget: aWidget)
    ]
    
    show: aWidget onAnswer: aBlock delegator: aDelegator  [ 
	<category: 'show/answer'>
	| answerHandler |
	answerHandler := AnswerHandler new.
	self decorateWith: aDelegator.
	answerHandler action: (Action new block: [:value |
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
	    ifNotNil: [self owner markDirty]
    ]
 
    setDirty [
	"You shouldn't call this method directly unless you know what you are doing."
	<category: 'states'>
	
	^self session addToDirtyWidgets: self
    ]
  
    newRootElement [
	<category: 'private'>
	^self defaultRootElementClass new
    ]
]

