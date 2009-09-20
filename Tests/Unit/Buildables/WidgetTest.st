TestCase subclass: WidgetTest [
    | c1 c2 c3 |

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Buildables'>

    setUp [
	<category: 'running'>
	c1 := WidgetMock1 new.
	c2 := WidgetMock2 new.
	c3 := WidgetMock3 new
    ]

    testAnswer [
	<category: 'testing'>
	CurrentContext
	    use: (Context new session: Session new; yourself)
	    during: [
		c1 show: c2 onAnswer: [:ans | self assert: ans = 'hello'].
		c2 show: c3 onAnswer: [:ans | self assert: ans = 10].
		c3 answer: 10.
		c2 answer: 'hello'.
		c1 show: c2 onAnswer: [:ans | self assert: ans = 'hello'].
		c1 show: c3 onAnswer: [:ans | self assert: ans = 10].
		c2 answer: 'hello'.
		c3 answer: 10]
    ]

    testDecorators [
	<category: 'testing'>
	| d1 d2 d3 |
	d1 := Decorator new.
	d2 := Decorator new.
	d3 := Decorator new.
	c1 decorateWith: d1.
	self assert: d1 decoratee = c1.
	c1 decorateWith: d2.
	self assert: d1 decoratee = d2.
	self assert: d1 decoratee decoratee = c1.
	c1 decorateWith: d3.
	self assert: d1 decoratee = d2.
	self assert: d1 decoratee decoratee = d3.
	self assert: d1 decoratee decoratee decoratee = c1.
	d2 removeYourself.
	self assert: d1 decoratee = d3.
	self assert: d1 decoratee decoratee = c1.
	d3 removeYourself.
	self assert: d1 decoratee = c1
    ]

    testRetrieveControl [
	<category: 'testing'>
	| str |
	str := WriteStream on: ''.
	CurrentContext
	    use: (Context new session: Session new)
	    during: [
		c1 show: c2.
		c1 show: c3.
		c1 build printHtmlOn: str.
		self deny: ('*test widget 1*' match: str contents).
		c1 retrieveControl.
		str := WriteStream on: ''.
		c1 build printHtmlOn: str.
		self assert: ('*test widget 1*' match: str contents)]
    ]

    testShow [
	<category: 'testing'>
	| str |
	str := WriteStream on: ''.
	CurrentContext
	    use: (Context new session: Session new; yourself)
	    during: [
		c1 show: c2.
		c1 build printHtmlOn: str.
		self assert: (str contents matchRegex: '.*test widget 2.*').
		str := WriteStream on: ''.
		c2 show: c3.
		c1 build printHtmlOn: str.
		self assert: (str contents matchRegex: '.*test widget 3.*').
		str := WriteStream on: ''.
		c3 answer.
		c1 build printHtmlOn: str.
		self assert: (str contents matchRegex: '.*test widget 2.*').
		str := WriteStream on: ''.
		c2 answer.
		c1 build printHtmlOn: str.
		self assert: (str contents matchRegex: '.*test widget 1.*')]
    ]
]

