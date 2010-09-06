TestCase subclass: ILWidgetTest [
    | app |

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Buildables'>

    setUp [
	<category: 'running'>
	app := ILApplicationMock new.
    ]

    testAnswer [
	<category: 'testing'>
	ILCurrentContext
	    use: (ILContext new session: ILSession new; yourself)
	    during: [
		app w1 show: app w2 onAnswer: [:ans | self assert: ans = 'hello'].
		app w2 show: app w3 onAnswer: [:ans | self assert: ans = 10].
		app w3 answer: 10.
		app w2 answer: 'hello'.
		app w1 show: app w2 onAnswer: [:ans | self assert: ans = 'hello'].
		app w1 show: app w3 onAnswer: [:ans | self assert: ans = 10].
		app w2 answer: 'hello'.
		app w3 answer: 10]
    ]

    testDecorators [
	<category: 'testing'>
	| d1 d2 d3 |
	d1 := ILDecorator new.
	d2 := ILDecorator new.
	d3 := ILDecorator new.
	app w1 decorateWith: d1.
	self assert: d1 decoratee = app w1.
	app w1 decorateWith: d2.
	self assert: d1 decoratee = d2.
	self assert: d1 decoratee decoratee = app w1.
	app w1 decorateWith: d3.
	self assert: d1 decoratee = d2.
	self assert: d1 decoratee decoratee = d3.
	self assert: d1 decoratee decoratee decoratee = app w1.
	d2 removeYourself.
	self assert: d1 decoratee = d3.
	self assert: d1 decoratee decoratee = app w1.
	d3 removeYourself.
	self assert: d1 decoratee = app w1
    ]

    testDependentWidget [
	<category: 'testing'>
	self withSessionDo: [
	    app w3 addDependentWidget: app w2.
	    app w2 addDependentWidget: app w1.
	    
	    self assert: (self session dirtyWidgets isEmpty).
	    app build.
	    app w3 markDirty.
	    self assert: (self session dirtyWidgets includes: app w3).
	    self assert: (self session dirtyWidgets includes: app w2).
	    self assert: (self session dirtyWidgets includes: app w1)]
    ]

    testRetrieveControl [
	<category: 'testing'>
	| str |
	str := WriteStream on: ''.
	self withSessionDo: [
		app w1 show: app w2.
		app w1 show: app w3.
		app w1 build printHtmlOn: str.
		self deny: ('*test widget 1*' match: str contents).
		app w1 retrieveControl.
		str := WriteStream on: ''.
		app w1 build printHtmlOn: str.
		self assert: ('*test widget 1*' match: str contents)]
    ]

    testShow [
	<category: 'testing'>
	| str |
	str := WriteStream on: ''.
	self withSessionDo: [
		app w1 show: app w2.
		app w1 build printHtmlOn: str.
		self assert: (str contents matchRegex: '.*test widget 2.*').
		str := WriteStream on: ''.
		app w2 show: app w3.
		app w1 build printHtmlOn: str.
		self assert: (str contents matchRegex: '.*test widget 3.*').
		str := WriteStream on: ''.
		app w3 answer.
		app w1 build printHtmlOn: str.
		self assert: (str contents matchRegex: '.*test widget 2.*').
		str := WriteStream on: ''.
		app w2 answer.
		app w1 build printHtmlOn: str.
		self assert: (str contents matchRegex: '.*test widget 1.*')]
    ]

    testDirtyWidget [
	<category: 'testing'>
	self withSessionDo: [
		self assert: (self session dirtyWidgets isEmpty).
		app w1 markDirty.
		self assert: (self session dirtyWidgets includes: app w1).
		self deny: (self session dirtyWidgets includes: app w2).
		app w2 markDirty.
		self assert: (self session dirtyWidgets includes: app w1).
		self assert: (self session dirtyWidgets includes: app w2)]
    ]

    testDirtyWidget2 [
	"The purpose of this test is to check if subwidgets are built twice
	when the owner and the widget are marked dirty"
	<category: 'testing'>

	| widget |
	widget := ILWidgetMock1 new.
	self withSessionDo: [

	    app build.
	    app w1 
		show: widget
		onAnswer: [:ans | 
		    widget markDirty. 
		    app w1 show: widget].
	    
	    
	    self assert: (self session dirtyWidgets includes: app w1).
	    self deny: (self session dirtyWidgets includes: widget).

	    app build.
	    self deny: (self session dirtyWidgets includes: app w1).
	    self deny: (self session dirtyWidgets includes: widget).

	    widget answer.
	    self assert: (self session dirtyWidgets includes: app w1).
	    self deny: (self session dirtyWidgets includes: widget)]
    ]

    session [
	<category: 'private'>
	^ILCurrentContext value session
    ]

    withSessionDo: aBlock [
	<category: 'private'>
	"To build widgets, we have to create a fake session,
	with a context, aRequest and an application"
	
	| context request |
	request := ILRequest new.
	context := ILContext new 
		application: app;
		session: ILSession new;
		request: request;
		yourself.
	ILCurrentContext 
		use: context
		during: [
		    context request url: (ILUrl absolute: '/').
		    context request fields: (Dictionary with: ('_state' -> context stateRegistry key)).	
		    context stateRegistry 
			register: app w1;
			register: app w2;
			register: app w3.
		    app respondOn: ILResponse new.
		    aBlock value]
    ]
]

