
ILElementTest subclass: ILXHTMLElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILXHTMLElement new
    ]

    testA [
	<category: 'testing'>
	| a |
	a := e a.
	self assert: (a isKindOf: ILAnchorElement)
    ]

    testArea [
	<category: 'testing'>
	| area |
	area := e area.
	self assert: (area isKindOf: ILAreaElement)
    ]

    testBdo [
	<category: 'testing'>
	| bdo |
	bdo := e bdo.
	self assert: (bdo isKindOf: ILDirectionElement)
    ]

    testBig [
	<category: 'testing'>
	| big |
	big := e big.
	self assert: (big isKindOf: ILTextElement).
	self assert: big tag = 'big'.
	big := e big: 'coucou'.
	self assert: big contents = 'coucou'
    ]

    testBlockquote [
	<category: 'testing'>
	| blockquote |
	blockquote := e blockquote.
	self assert: (blockquote isKindOf: ILTextElement).
	self assert: blockquote tag = 'blockquote'.
	blockquote := e big: 'coucou'.
	self assert: blockquote contents = 'coucou'
    ]

    testBold [
	<category: 'testing'>
	| bold |
	bold := e bold.
	self assert: (bold isKindOf: ILTextElement).
	self assert: bold tag = 'bold'.
	bold := e big: 'coucou'.
	self assert: bold contents = 'coucou'
    ]

    testBr [
	<category: 'testing'>
	| br |
	br := e br.
	self assert: (br isKindOf: ILBreakElement)
    ]

    testButton [
	<category: 'testing'>
	| button |
	button := e button.
	self assert: (button isKindOf: ILButtonElement)
    ]

    testCheckbox [
	<category: 'testing'>
	| checkbox |
	checkbox := e checkbox.
	self assert: (checkbox isKindOf: ILCheckboxElement)
    ]

    testCite [
	<category: 'testing'>
	| cite |
	cite := e cite.
	self assert: (cite isKindOf: ILTextElement).
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
	self assert: (code isKindOf: ILTextElement).
	self assert: code tag = 'code'.
	code := e big: 'coucou'.
	self assert: code contents = 'coucou'
    ]

    testCss [
	<category: 'testing'>
	e := e css.
	self assert: (e isKindOf: ILLinkElement).
	self shouldHaveAttribute: 'rel' value: 'Stylesheet'.
	self shouldHaveAttribute: 'type' value: 'text/css'
    ]

    testDd [
	<category: 'testing'>
	| dd |
	dd := e dd.
	self assert: (dd isKindOf: ILTextElement).
	self assert: dd tag = 'dd'
    ]

    testDfn [
	<category: 'testing'>
	| dfn |
	dfn := e dfn.
	self assert: (dfn isKindOf: ILTextElement).
	self assert: dfn tag = 'dfn'
    ]

    testDiv [
	<category: 'testing'>
	| div |
	div := e div.
	self assert: (div isKindOf: ILDivElement)
    ]

    testDl [
	<category: 'testing'>
	| dl |
	dl := e dl.
	self assert: (dl isKindOf: ILTextElement).
	self assert: dl tag = 'dl'
    ]

    testDt [
	<category: 'testing'>
	| dt |
	dt := e dt.
	self assert: (dt isKindOf: ILTextElement).
	self assert: dt tag = 'dt'
    ]

    testEm [
	<category: 'testing'>
	| em |
	em := e em.
	self assert: (em isKindOf: ILTextElement).
	self assert: em tag = 'em'.
	em := e em: 'coucou'.
	self assert: em contents = 'coucou'
    ]

    testFavicon [
	<category: 'testing'>
	e := e favicon.
	self assert: (e isKindOf: ILLinkElement).
	self shouldHaveAttribute: 'rel' value: 'shortcut icon'.
	e := e favicon: 'hello'.
	self shouldHaveAttribute: 'href' value: 'hello'
    ]

    testFieldset [
	<category: 'testing'>
	| fieldset |
	fieldset := e fieldset.
	self assert: (fieldset isKindOf: ILFieldsetElement)
    ]

    testFile [
	<category: 'testing'>
	e := e file.
	self assert: (e isKindOf: ILInputElement).
	self shouldHaveAttribute: 'type' value: 'file'
    ]

    testForm [
	<category: 'testing'>
	| form |
	form := e form.
	self assert: (form isKindOf: ILFormElement)
    ]

    testH [
	<category: 'testing'>
	| h |
	h := e h.
	self assert: (h isKindOf: ILHeadingElement)
    ]

    testH1 [
	<category: 'testing'>
	| h1 |
	h1 := e h1.
	self assert: (h1 isKindOf: ILHeadingElement).
	self assert: h1 level = '1'
    ]

    testH2 [
	<category: 'testing'>
	| h2 |
	h2 := e h2.
	self assert: (h2 isKindOf: ILHeadingElement).
	self assert: h2 level = '2'
    ]

    testH3 [
	<category: 'testing'>
	| h3 |
	h3 := e h3.
	self assert: (h3 isKindOf: ILHeadingElement).
	self assert: h3 level = '3'
    ]

    testH4 [
	<category: 'testing'>
	| h4 |
	h4 := e h4.
	self assert: (h4 isKindOf: ILHeadingElement).
	self assert: h4 level = '4'
    ]

    testH5 [
	<category: 'testing'>
	| h5 |
	h5 := e h5.
	self assert: (h5 isKindOf: ILHeadingElement).
	self assert: h5 level = '5'
    ]

    testH6 [
	<category: 'testing'>
	| h6 |
	h6 := e h6.
	self assert: (h6 isKindOf: ILHeadingElement).
	self assert: h6 level = '6'
    ]

    testHr [
	<category: 'testing'>
	| hr |
	hr := e hr.
	self assert: (hr isKindOf: ILHorizontalRuleElement)
    ]

    testHtml [
	<category: 'testing'>
	| html |
	html := e html: 'coucou'.
	self assert: (html isKindOf: ILRawHtmlElement).
	self assert: html contents = 'coucou'
    ]

    testI [
	<category: 'testing'>
	| i |
	i := e i.
	self assert: (i isKindOf: ILTextElement).
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
	self assert: (img isKindOf: ILImageElement)
    ]

    testInput [
	<category: 'testing'>
	| input |
	input := e input.
	self assert: (input isKindOf: ILInputElement)
    ]

    testJavascript [
	<category: 'testing'>
	e := e javascript.
	self assert: (e isKindOf: ILScriptElement).
	self shouldHaveAttribute: 'type' value: 'text/javascript'.
    ]

    testLabel [
	<category: 'testing'>
	| label |
	label := e label.
	self assert: (label isKindOf: ILLabelElement)
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
	self assert: (legend isKindOf: ILLegendElement)
    ]

    testLi [
	<category: 'testing'>
	| li |
	li := e li.
	self assert: (li isKindOf: ILListItemElement)
    ]

    testLink [
	<category: 'testing'>
	| link |
	link := e link.
	self assert: (link isKindOf: ILLinkElement)
    ]

    testMap [
	<category: 'testing'>
	| map |
	map := e map.
	self assert: (map isKindOf: ILMapElement)
    ]

    testMeta [
	<category: 'testing'>
	| meta |
	meta := e meta.
	self assert: (meta isKindOf: ILMetaElement)
    ]

    testNbsp [
	<category: 'testing'>
	| nbsp |
	nbsp := e nbsp.
	self assert: (nbsp isKindOf: ILRawHtmlElement).
	self assert: nbsp contents = '&nbsp;'
    ]

    testObject [
	<category: 'testing'>
	| object |
	object := e object.
	self assert: (object isKindOf: ILObjectElement)
    ]

    testOl [
	<category: 'testing'>
	e := e ol.
	self assert: (e isKindOf: ILListElement).
	self assert: (e tag = 'ol')
    ]

    testOptGroup [
	<category: 'testing'>
	| optgroup |
	optgroup := e optgroup.
	self assert: (optgroup isKindOf: ILOptionGroupElement)
    ]

    testOption [
	<category: 'testing'>
	| option |
	option := e option.
	self assert: (option isKindOf: ILOptionElement)
    ]

    testP [
	<category: 'testing'>
	| p |
	p := e p.
	self assert: (p isKindOf: ILParagraphElement)
    ]

    testParam [
	<category: 'testing'>
	| param |
	param := e param.
	self assert: (param isKindOf: ILParameterElement)
    ]

    testPre [
	<category: 'testing'>
	| pre |
	pre := e pre.
	self assert: (pre isKindOf: ILTextElement).
	self assert: pre tag = 'pre'.
	pre := e pre: 'coucou'.
	self assert: pre contents = 'coucou'
    ]

    testQuote [
	<category: 'testing'>
	| quote |
	quote := e quote.
	self assert: (quote isKindOf: ILTextElement).
	self assert: quote tag = 'quote'.
	quote := e quote: 'coucou'.
	self assert: quote contents = 'coucou'
    ]

    testRadio [
	<category: 'testing'>
	| radio |
	radio := e radio.
	self assert: (radio isKindOf: ILRadioButtonElement)
    ]

    testReset [
	<category: 'testing'>
	e := e reset.
	self assert: (e isKindOf: ILInputElement).
	self shouldHaveAttribute: 'type' value: 'reset'
    ]

    testScript [
	<category: 'testing'>
	| script |
	script := e script.
	self assert: (script isKindOf: ILScriptElement).
	script := e script: 'coucou'.
	self assert: script contents = 'coucou'
    ]

    testSmall [
	<category: 'testing'>
	| small |
	small := e small.
	self assert: (small isKindOf: ILTextElement).
	self assert: small tag = 'small'.
	small := e small: 'coucou'.
	self assert: small contents = 'coucou'
    ]

    testSpace [
	<category: 'testing'>
	e := e space.
	self assert: (e isKindOf: ILTextElement).
	self assert: (e contents = ' ')
    ]

    testSpan [
	<category: 'testing'>
	| span |
	span := e span.
	self assert: (span isKindOf: ILSpanElement)
    ]

    testStrong [
	<category: 'testing'>
	| strong |
	strong := e strong.
	self assert: (strong isKindOf: ILTextElement).
	self assert: strong tag = 'strong'.
	strong := e strong: 'coucou'.
	self assert: strong contents = 'coucou'
    ]

    testStyle [
	<category: 'testing'>
	e style: 'foo'.
	self shouldHaveAttribute: 'style' value: 'foo'.
	self assert: (e style = 'foo')
    ]

    testSubmit [
	<category: 'testing'>
	e := e submit.
	self assert: (e isKindOf: ILInputElement).
	self shouldHaveAttribute: 'type' value: 'submit'
    ]

    testSubscript [
	<category: 'testing'>
	| sub |
	sub := e subscript.
	self assert: (sub isKindOf: ILTextElement).
	self assert: (sub tag = 'subscript').
	sub := e subscript: 'hello'.
	self assert: (sub contents = 'hello')
    ]

    testSuperscript [
	<category: 'testing'>
	| superscript |
	superscript := e superscript.
	self assert: (superscript isKindOf: ILTextElement).
	self assert: (superscript tag = 'superscript').
	superscript := e superscript: 'hello'.
	self assert: (superscript contents = 'hello')
    ]

    testTable [
	<category: 'testing'>
	| table |
	table := e table.
	self assert: (table isKindOf: ILTableElement)
    ]

    testTbody [
	<category: 'testing'>
	| tbody |
	tbody := e tbody.
	self assert: (tbody isKindOf: ILTableBodyElement)
    ]

    testTd [
	<category: 'testing'>
	| td |
	td := e td.
	self assert: (td isKindOf: ILTableDataElement)
    ]

    testTextarea [
	<category: 'testing'>
	| textarea |
	textarea := e textarea.
	self assert: (textarea isKindOf: ILTextAreaElement)
    ]

    testTfoot [
	<category: 'testing'>
	| tfoot |
	tfoot := e tfoot.
	self assert: (tfoot isKindOf: ILTableFootElement)
    ]

    testTh [
	<category: 'testing'>
	| th |
	th := e th.
	self assert: (th isKindOf: ILTableHeaderElement)
    ]

    testThead [
	<category: 'testing'>
	| thead |
	thead := e thead.
	self assert: (thead isKindOf: ILTableHeadElement)
    ]

    testTitle [
	<category: 'testing'>
	e title: 'foo'.
	self shouldHaveAttribute: 'title' value: 'foo'.
	self assert: (e title = 'foo')
    ]

    testTr [
	<category: 'testing'>
	| tr |
	tr := e tr.
	self assert: (tr isKindOf: ILTableRowElement)
    ]

    testTt [
	<category: 'testing'>
	| tt |
	tt := e tt.
	self assert: (tt isKindOf: ILTextElement).
	self assert: (tt tag = 'tt')
    ]

    testUl [
	<category: 'testing'>
	e := e ul.
	self assert: (e isKindOf: ILListElement).
	self assert: (e tag = 'ul')
    ]

    testVar [
	<category: 'testing'>
	| var |
	var := e var.
	self assert: (var isKindOf: ILTextElement).
	self assert: (var tag = 'var').
	
	"This test makes gst crash...."
	self assert: false.
	"var := e var: 'hello'.
	self assert: (var contents = 'hello')"
    ]

    testXmlLang [
	<category: 'testing'>
	e xmlLang: 'foo'.
	self shouldHaveAttribute: 'xml:lang' value: 'foo'
    ]

]

