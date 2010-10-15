ILElementTest subclass: ILHTMLBuilderElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILHTMLBuilderElement new
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
	big := e big: 'foo'.
	self assert: big contents = 'foo'
    ]

    testBlockquote [
	<category: 'testing'>
	| blockquote |
	blockquote := e blockquote.
	self assert: (blockquote isKindOf: ILTextElement).
	self assert: blockquote tag = 'blockquote'.
	blockquote := e blockquote: 'foo'.
	self assert: blockquote contents = 'foo'
    ]

    testB [
	<category: 'testing'>
	| b |
	b := e b.
	self assert: (b isKindOf: ILTextElement).
	self assert: b tag = 'b'.
	b := e b: 'foo'.
	self assert: b contents = 'foo'
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
	cite := e cite: 'foo'.
	self assert: cite contents = 'foo'
    ]

    testClass [
	<category: 'testing'>
	e class: 'foo'.
	self shouldHaveAttribute: 'class' value: 'foo'
    ]

    testClass [
	<category: 'testing'>
	e cssClass: 'foo'.
	self shouldHaveAttribute: 'class' value: 'foo'.
	self assert: e cssClass = 'foo'
    ]

    testCode [
	<category: 'testing'>
	| code |
	code := e code.
	self assert: (code isKindOf: ILTextElement).
	self assert: code tag = 'code'.
	code := e code: 'foo'.
	self assert: code contents = 'foo'
    ]

    testStylesheet [
	<category: 'testing'>
	e := e stylesheet.
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
	em := e em: 'foo'.
	self assert: em contents = 'foo'
    ]

    testFavicon [
	<category: 'testing'>
	e := e favicon.
	self assert: (e isKindOf: ILLinkElement).
	self shouldHaveAttribute: 'rel' value: 'shortcut icon'.
	e := e favicon: 'foo'.
	self shouldHaveAttribute: 'href' value: 'foo'
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
	html := e html: 'foo'.
	self assert: (html isKindOf: ILRawHtmlElement).
	self assert: html contents = 'foo'
    ]

    testI [
	<category: 'testing'>
	| i |
	i := e i.
	self assert: (i isKindOf: ILTextElement).
	self assert: i tag = 'i'.
	i := e i: 'foo'.
	self assert: i contents = 'foo'
    ]

    testId [
	<category: 'testing'>
	e id: 'foo'.
	self assert: (e id = 'foo')
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

    testOnEvents [
	<category: 'testing'>
	e onEvent: 'foo' add: 'bar'.
	self assert: (e attributeAt: 'onfoo') = 'bar'.
	e onClick: 'foo'.
	self assert: (e attributeAt: 'onclick') = 'foo'.
	e onMouseOut: 'foo'.
	self assert: (e attributeAt: 'onmouseout') = 'foo'.
	e onMouseOver: 'foo'.
	self assert: (e attributeAt: 'onmouseover') = 'foo'.
	e onSelect: 'foo'.
	self assert: (e attributeAt: 'onselect') = 'foo'.
	e onKeyUp: 'foo'.
	self assert: (e attributeAt: 'onkeyup') = 'foo'.
	e onDoubleClick: 'foo'.
	self assert: (e attributeAt: 'ondblclick') = 'foo'.
	e onKeyPress: 'foo'.
	self assert: (e attributeAt: 'onkeypress') = 'foo'.
	e onKeyDown: 'foo'.
	self assert: (e attributeAt: 'onkeydown') = 'foo'.
	e onChange: 'foo'.
	self assert: (e attributeAt: 'onchange') = 'foo'.
	e onBlur: 'foo'.
	self assert: (e attributeAt: 'onblur') = 'foo'
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
	pre := e pre: 'foo'.
	self assert: pre contents = 'foo'
    ]

    testQuote [
	<category: 'testing'>
	| quote |
	quote := e quote.
	self assert: (quote isKindOf: ILTextElement).
	self assert: quote tag = 'quote'.
	quote := e quote: 'foo'.
	self assert: quote contents = 'foo'
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
	script := e script: 'foo'.
	self assert: script contents = 'foo'
    ]

    testSmall [
	<category: 'testing'>
	| small |
	small := e small.
	self assert: (small isKindOf: ILTextElement).
	self assert: small tag = 'small'.
	small := e small: 'foo'.
	self assert: small contents = 'foo'
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
	strong := e strong: 'foo'.
	self assert: strong contents = 'foo'
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
	sub := e subscript: 'foo'.
	self assert: (sub contents = 'foo')
    ]

    testSuperscript [
	<category: 'testing'>
	| superscript |
	superscript := e superscript.
	self assert: (superscript isKindOf: ILTextElement).
	self assert: (superscript tag = 'superscript').
	superscript := e superscript: 'foo'.
	self assert: (superscript contents = 'foo')
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
	
	var := e var: 'foo'.
	self assert: (var contents = 'foo')
    ]

    testXmlLang [
	<category: 'testing'>
	e xmlLang: 'foo'.
	self shouldHaveAttribute: 'xml:lang' value: 'foo'
    ]

]

