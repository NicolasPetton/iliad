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

    testDecorations [
	<category: 'testing'>
	| d1 d2 |
	d1 := Decorator new.
	d2 := Decorator new.
	c1 addDecoration: d1.
	self assert: c1 decorator decoratee = d1.
	self assert: c1 decorator decoratee decoratee = c1.
	c1 addDecoration: d2.
	self assert: c1 decorator decoratee decoratee = d2.
	self assert: c1 decorator decoratee decoratee decoratee = c1.
	d1 removeYourself.
	self assert: c1 decorator decoratee = d2.
	self assert: c1 decorator decoratee decoratee = c1.
	d2 removeYourself.
	self assert: c1 decorator decoratee = c1
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

