
ElementTest subclass: XHTMLElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Elements'>

    setUp [
	<category: 'running'>
	e := XHTMLElement new
    ]

    testA [
	<category: 'testing'>
	| a |
	a := e a.
	self assert: (a isKindOf: AnchorElement)
    ]

    testArea [
	<category: 'testing'>
	| area |
	area := e area.
	self assert: (area isKindOf: AreaElement)
    ]

    testBdo [
	<category: 'testing'>
	| bdo |
	bdo := e bdo.
	self assert: (bdo isKindOf: DirectionElement)
    ]

    testBig [
	<category: 'testing'>
	| big |
	big := e big.
	self assert: (big isKindOf: TextElement).
	self assert: big tag = 'big'.
	big := e big: 'coucou'.
	self assert: big contents = 'coucou'
    ]

    testBlockquote [
	<category: 'testing'>
	| blockquote |
	blockquote := e blockquote.
	self assert: (blockquote isKindOf: TextElement).
	self assert: blockquote tag = 'blockquote'.
	blockquote := e big: 'coucou'.
	self assert: blockquote contents = 'coucou'
    ]

    testBold [
	<category: 'testing'>
	| bold |
	bold := e bold.
	self assert: (bold isKindOf: TextElement).
	self assert: bold tag = 'bold'.
	bold := e big: 'coucou'.
	self assert: bold contents = 'coucou'
    ]

    testBr [
	<category: 'testing'>
	| br |
	br := e br.
	self assert: (br isKindOf: BreakElement)
    ]

    testButton [
	<category: 'testing'>
	| button |
	button := e button.
	self assert: (button isKindOf: ButtonElement)
    ]

    testCheckbox [
	<category: 'testing'>
	| checkbox |
	checkbox := e checkbox.
	self assert: (checkbox isKindOf: CheckboxElement)
    ]

    testCite [
	<category: 'testing'>
	| cite |
	cite := e cite.
	self assert: (cite isKindOf: TextElement).
	self assert: cite tag = 'cite'.
	cite := e big: 'coucou'.
	self assert: cite contents = 'coucou'
    ]

    testClass [
	<category: 'testing'>
	e class: 'foo'.
	self shouldHaveAttribute: 'class' value: 'foo'
    ]

    testCode [
	<category: 'testing'>
	| code |
	code := e code.
	self assert: (code isKindOf: TextElement).
	self assert: code tag = 'code'.
	code := e big: 'coucou'.
	self assert: code contents = 'coucou'
    ]

    testDd [
	<category: 'testing'>
	| dd |
	dd := e dd.
	self assert: (dd isKindOf: TextElement).
	self assert: dd tag = 'dd'
    ]

    testDfn [
	<category: 'testing'>
	| dfn |
	dfn := e dfn.
	self assert: (dfn isKindOf: TextElement).
	self assert: dfn tag = 'dfn'
    ]

    testDiv [
	<category: 'testing'>
	| div |
	div := e div.
	self assert: (div isKindOf: DivElement)
    ]

    testDl [
	<category: 'testing'>
	| dl |
	dl := e dl.
	self assert: (dl isKindOf: TextElement).
	self assert: dl tag = 'dl'
    ]

    testDt [
	<category: 'testing'>
	| dt |
	dt := e dt.
	self assert: (dt isKindOf: TextElement).
	self assert: dt tag = 'dt'
    ]

    testEm [
	<category: 'testing'>
	| em |
	em := e em.
	self assert: (em isKindOf: TextElement).
	self assert: em tag = 'em'.
	em := e em: 'coucou'.
	self assert: em contents = 'coucou'
    ]

    testFieldset [
	<category: 'testing'>
	| fieldset |
	fieldset := e fieldset.
	self assert: (fieldset isKindOf: FieldsetElement)
    ]

    testForm [
	<category: 'testing'>
	| form |
	form := e form.
	self assert: (form isKindOf: FormElement)
    ]

    testH [
	<category: 'testing'>
	| h |
	h := e h.
	self assert: (h isKindOf: HeadingElement)
    ]

    testH1 [
	<category: 'testing'>
	| h1 |
	h1 := e h1.
	self assert: (h1 isKindOf: HeadingElement).
	self assert: h1 level = '1'
    ]

    testH2 [
	<category: 'testing'>
	| h2 |
	h2 := e h2.
	self assert: (h2 isKindOf: HeadingElement).
	self assert: h2 level = '2'
    ]

    testH3 [
	<category: 'testing'>
	| h3 |
	h3 := e h3.
	self assert: (h3 isKindOf: HeadingElement).
	self assert: h3 level = '3'
    ]

    testH4 [
	<category: 'testing'>
	| h4 |
	h4 := e h4.
	self assert: (h4 isKindOf: HeadingElement).
	self assert: h4 level = '4'
    ]

    testH5 [
	<category: 'testing'>
	| h5 |
	h5 := e h5.
	self assert: (h5 isKindOf: HeadingElement).
	self assert: h5 level = '5'
    ]

    testH6 [
	<category: 'testing'>
	| h6 |
	h6 := e h6.
	self assert: (h6 isKindOf: HeadingElement).
	self assert: h6 level = '6'
    ]

    testHr [
	<category: 'testing'>
	| hr |
	hr := e hr.
	self assert: (hr isKindOf: HorizontalRuleElement)
    ]

    testHtml [
	<category: 'testing'>
	| html |
	html := e html: 'coucou'.
	self assert: (html isKindOf: RawHtmlElement).
	self assert: html contents = 'coucou'
    ]

    testI [
	<category: 'testing'>
	| i |
	i := e i.
	self assert: (i isKindOf: TextElement).
	self assert: i tag = 'i'.
	i := e i: 'coucou'.
	self assert: i contents = 'coucou'
    ]

    testId [
	<category: 'testing'>
	e id: 'foo'.
	self shouldHaveAttribute: 'id' value: 'foo'
    ]

    testImg [
	<category: 'testing'>
	| img |
	img := e img.
	self assert: (img isKindOf: ImageElement)
    ]

    testInput [
	<category: 'testing'>
	| input |
	input := e input.
	self assert: (input isKindOf: InputElement)
    ]

    testLabel [
	<category: 'testing'>
	| label |
	label := e label.
	self assert: (label isKindOf: LabelElement)
    ]

    testLang [
	<category: 'testing'>
	e lang: 'foo'.
	self shouldHaveAttribute: 'lang' value: 'foo'
    ]

    testLegend [
	<category: 'testing'>
	| legend |
	legend := e legend.
	self assert: (legend isKindOf: LegendElement)
    ]

    testLi [
	<category: 'testing'>
	| li |
	li := e li.
	self assert: (li isKindOf: ListItemElement)
    ]

    testLink [
	<category: 'testing'>
	| link |
	link := e link.
	self assert: (link isKindOf: LinkElement)
    ]

    testMap [
	<category: 'testing'>
	| map |
	map := e map.
	self assert: (map isKindOf: MapElement)
    ]

    testMeta [
	<category: 'testing'>
	| meta |
	meta := e meta.
	self assert: (meta isKindOf: MetaElement)
    ]

    testNbsp [
	<category: 'testing'>
	| nbsp |
	nbsp := e nbsp.
	self assert: (nbsp isKindOf: RawHtmlElement).
	self assert: nbsp contents = '&nbsp;'
    ]

    testObject [
	<category: 'testing'>
	| object |
	object := e object.
	self assert: (object isKindOf: ObjectElement)
    ]

    testOptGroup [
	<category: 'testing'>
	| optgroup |
	optgroup := e optgroup.
	self assert: (optgroup isKindOf: OptionGroupElement)
    ]

    testOption [
	<category: 'testing'>
	| option |
	option := e option.
	self assert: (option isKindOf: OptionElement)
    ]

    testP [
	<category: 'testing'>
	| p |
	p := e p.
	self assert: (p isKindOf: ParagraphElement)
    ]

    testParam [
	<category: 'testing'>
	| param |
	param := e param.
	self assert: (param isKindOf: ParameterElement)
    ]

    testPre [
	<category: 'testing'>
	| pre |
	pre := e pre.
	self assert: (pre isKindOf: TextElement).
	self assert: pre tag = 'pre'.
	pre := e pre: 'coucou'.
	self assert: pre contents = 'coucou'
    ]

    testQuote [
	<category: 'testing'>
	| quote |
	quote := e quote.
	self assert: (quote isKindOf: TextElement).
	self assert: quote tag = 'quote'.
	quote := e quote: 'coucou'.
	self assert: quote contents = 'coucou'
    ]

    testRadio [
	<category: 'testing'>
	| radio |
	radio := e radio.
	self assert: (radio isKindOf: RadioButtonElement)
    ]

    testScript [
	<category: 'testing'>
	| script |
	script := e script.
	self assert: (script isKindOf: ScriptElement).
	script := e script: 'coucou'.
	self assert: script contents = 'coucou'
    ]

    testSmall [
	<category: 'testing'>
	| small |
	small := e small.
	self assert: (small isKindOf: TextElement).
	self assert: small tag = 'small'.
	small := e small: 'coucou'.
	self assert: small contents = 'coucou'
    ]

    testSpan [
	<category: 'testing'>
	| span |
	span := e span.
	self assert: (span isKindOf: SpanElement)
    ]

    testStrong [
	<category: 'testing'>
	| strong |
	strong := e strong.
	self assert: (strong isKindOf: TextElement).
	self assert: strong tag = 'strong'.
	strong := e strong: 'coucou'.
	self assert: strong contents = 'coucou'
    ]

    testStyle [
	<category: 'testing'>
	e style: 'foo'.
	self shouldHaveAttribute: 'style' value: 'foo'
    ]

    testTable [
	<category: 'testing'>
	| table |
	table := e table.
	self assert: (table isKindOf: TableElement)
    ]

    testTbody [
	<category: 'testing'>
	| tbody |
	tbody := e tbody.
	self assert: (tbody isKindOf: TableBodyElement)
    ]

    testTd [
	<category: 'testing'>
	| td |
	td := e td.
	self assert: (td isKindOf: TableDataElement)
    ]

    testTextarea [
	<category: 'testing'>
	| textarea |
	textarea := e textarea.
	self assert: (textarea isKindOf: TextAreaElement)
    ]

    testTfoot [
	<category: 'testing'>
	| tfoot |
	tfoot := e tfoot.
	self assert: (tfoot isKindOf: TableFootElement)
    ]

    testTh [
	<category: 'testing'>
	| th |
	th := e th.
	self assert: (th isKindOf: TableHeaderElement)
    ]

    testThead [
	<category: 'testing'>
	| thead |
	thead := e thead.
	self assert: (thead isKindOf: TableHeadElement)
    ]

    testTitle [
	<category: 'testing'>
	e title: 'foo'.
	self shouldHaveAttribute: 'title' value: 'foo'
    ]

    testTr [
	<category: 'testing'>
	| tr |
	tr := e tr.
	self assert: (tr isKindOf: TableRowElement)
    ]

    testTt [
	<category: 'testing'>
	| tt |
	tt := e tt.
	self assert: (tt isKindOf: TextElement).
	self assert: (tt tag = 'tt')
    ]

    testXmlLang [
	<category: 'testing'>
	e xmlLang: 'foo'.
	self shouldHaveAttribute: 'xml:lang' value: 'foo'
    ]

]

