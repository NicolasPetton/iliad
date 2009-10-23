"======================================================================
|
|   Iliad.XHTMLElement class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
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



Element subclass: XHTMLElement [
    
    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    contentType [
	<category: 'accessing'>
	^'text/html'
    ]

    title [
	<category: 'accessing attributes'>
	^self attributeAt: 'title'
    ]

    title: aString [
	<category: 'accessing attributes'>
	^self attributeAt: 'title' put: aString
    ]


    class: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'class' put: aString
    ]

    id [
	<category: 'accessing attributes'>
	^self attributeAt: 'id'
    ]

    id: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'id' put: aString
    ]

    lang: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'lang' put: aString
    ]

    xmlLang: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'xml:lang' put: aString
    ]

    style [
	<category: 'accessing attributes'>
	^self attributeAt: 'style'
    ]

    style: aString [
	<category: 'accessing attibutes'>
	^self attributeAt: 'style'
		put: aString  
    ]

    onBlur: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'blur' do: aString
    ]

    onChange: aString [
	<category: 'accessing  attributes-events'>
	self onEvent: 'change' do: aString
    ]

    onClick: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'click' do: aString
    ]

    onDoubleClick: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'dblclick' do: aString
    ]

    onEvent: aString do: anotherString [
	<category: 'accessing attributes-events'>
	| oldString |
	oldString := (self attributeAt: 'on', aString) ifNil: [''].
	self attributeAt: 'on', aString put: (oldString, anotherString)
    ]

    onFocus: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'focus' do: aString
    ]

    onKeyDown: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'keydown' do: aString
    ]

    onKeyPress: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'keypress' do: aString
    ]

    onKeyUp: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'keyup' do: aString
    ]

    onMouseOut: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'mouseout' do: aString
    ]

    onMouseOver: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'mouseover' do: aString
    ]

    onSelect: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'select' do: aString
    ]

    a [
	<category: 'adding-conveniance'>
	^self add: AnchorElement new
    ]

    area [
	<category: 'adding-conveniance'>
	^self add: AreaElement new
    ]

    bdo [
	<category: 'adding-conveniance'>
	^self add: DirectionElement new
    ]

    big [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'big';
	    yourself)
    ]

    big: aString [
	<category: 'adding-conveniance'>
	^self big
	    contents: aString;
	    yourself
    ]

    blockquote [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'blockquote';
	    yourself)
    ]

    blockquote: aString [
	<category: 'adding-conveniance'>
	^self blockquote
	    contents: aString;
	    yourself
    ]

    bold [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'bold';
	    yourself)
    ]

    bold: aString [
	<category: 'adding-conveniance'>
	^self bold
	    contents: aString;
	    yourself
    ]

    br [
	<category: 'adding-conveniance'>
	^self add: BreakElement new
    ]

    button [
	<category: 'adding-conveniance'>
	^self add: ButtonElement new
    ]

    checkbox [
	<category: 'adding-conveniance'>
	^self add: CheckboxElement new
    ]

    cite [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'cite';
	    yourself)
    ]

    cite: aString [
	<category: 'adding-conveniance'>
	^self cite
	    contents: aString;
	    yourself
    ]

    code [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'code';
	    yourself)
    ]

    code: aString [
	<category: 'adding-conveniance'>
	^self code
	    contents: aString;
	    yourself
    ]

    dd [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'dd';
	    yourself)
    ]

    dfn [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'dfn';
	    yourself)
    ]

    dl [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'dl';
	    yourself)
    ]

    dt [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'dt';
	    yourself)
    ]

    div [
	<category: 'adding-conveniance'>
	^self add: DivElement new
    ]

    em [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'em';
	    yourself)
    ]

    em: aString [
	<category: 'adding-conveniance'>
	^self em
	    contents: aString;
	    yourself
    ]

    favicon [
	<category: 'adding-conveniance'>
	^self link
	    beFavicon;
	    yourself
    ]

    favicon: aString [
	<category: 'adding-conveniance'>
	^self favicon
	    href: aString;
	    yourself
    ]

    fieldset [
	<category: 'adding-conveniance'>
	^self add: FieldsetElement new
    ]

    file [
	<category: 'adding-conveniance'>
	^self input
	    beFile;
	    yourself
    ]

    form [
	<category: 'adding-conveniance'>
	^self add: FormElement new
    ]

    h1 [
	<category: 'adding-conveniance'>
	^self add: (HeadingElement new
	    level: 1;
	    yourself)
    ]

    h1: aString [
	<category: 'adding-conveniance'>
	^self h1
	    text: aString;
	    yourself
    ]

    h2 [
	<category: 'adding-conveniance'>
	^self add: (HeadingElement new
	    level: 2;
	    yourself)
    ]

    h2: aString [
	<category: 'adding-conveniance'>
	^self h2
	    text: aString;
	    yourself
    ]

    h3 [
	<category: 'adding-conveniance'>
	^self add: (HeadingElement new
	    level: 3;
	    yourself)
    ]

    h3: aString [
	<category: 'adding-conveniance'>
	^self h3
	    text: aString;
	    yourself
    ]

    h4 [
	<category: 'adding-conveniance'>
	^self add: (HeadingElement new
	    level: 4;
	    yourself)
    ]

    h4: aString [
	<category: 'adding-conveniance'>
	^self h4
	    text: aString;
	    yourself
    ]

    h5 [
	<category: 'adding-conveniance'>
	^self add: (HeadingElement new
	    level: 5;
	    yourself)
    ]

    h5: aString [
	<category: 'adding-conveniance'>
	^self h5
	    text: aString;
	    yourself
    ]

    h6 [
	<category: 'adding-conveniance'>
	^self add: (HeadingElement new
	    level: 6;
	    yourself)
    ]

    h6: aString [
	<category: 'adding-conveniance'>
	^self h6
	    text: aString;
	    yourself
    ]

    h [
	<category: 'adding-conveniance'>
	^self add: HeadingElement new
    ]

    hr [
	<category: 'adding-conveniance'>
	^self add: HorizontalRuleElement new
    ]

    html: aString [
	<category: 'adding-conveniance'>
	^self add: (RawHtmlElement new
	    contents: aString;
	    yourself)
    ]

    img [
	<category: 'adding-conveniance'>
	^self add: ImageElement new
    ]

    img: aString [
	<category: 'adding-conveniance'>
	^self img
	    source: aString;
	    yourself
    ]

    input [
	<category: 'adding-conveniance'>
	^self add: InputElement new
    ]

    i [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'i';
	    yourself)
    ]

    i: aString [
	<category: 'adding-conveniance'>
	^self i
	    contents: aString;
	    yourself
    ]

    javascript [
	<category: 'adding-conveniance'>
	^self script
	    beJavascript;
	    yourself
    ]

    javascript: aString [
	<category: 'adding-conveniance'>
	^self script
	    beJavascript;
	    contents: aString;
	    yourself
    ]

    label [
	<category: 'adding-conveniance'>
	^self add: LabelElement new
    ]

    legend [
	<category: 'adding-conveniance'>
	^self add: LegendElement new
    ]

    legend: aString [
	<category: 'adding-conveniance'>
	^self legend
	    text: aString;
	    yourself
    ]

    link [
	<category: 'adding-conveenience'>
	^self add: LinkElement new
    ]

    li [
	<category: 'adding-conveniance'>
	^self add: ListItemElement new
    ]

    map [
	<category: 'adding-conveniance'>
	^self add: MapElement new
    ]

    meta [
	<category: 'adding-conveniance'>
	^self add: MetaElement new
    ]

    nbsp [
	^self add: (RawHtmlElement new 
	    contents: '&nbsp;'; 
	    yourself)
    ]

    object [
	<category: 'adding-conveniance'>
	^self add: ObjectElement new
    ]

    option [
	<category: 'adding-conveniance'>
	^self add: OptionElement new
    ]

    optgroup [
	<category: 'adding-conveniance'>
	^self add: OptionGroupElement new
    ]
    
    ol [
	<category: 'adding-conveniance'>
	^self add: (ListElement new 
	    beOrdered;
	    yourself)
    ]

    p [
	<category: 'adding-conveniance'>
	^self add: ParagraphElement new
    ]

    param [
	<category: 'adding-conveniance'>
	^self add: ParameterElement new
    ]

    password [
	<category: 'adding-conveniance'>
	^self input
	    bePassword;
	    yourself
    ]

    pre [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'pre';
	    yourself)
    ]

    pre: aString [
	<category: 'adding-conveniance'>
	^self pre
	    contents: aString;
	    yourself
    ]

    quote [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'quote';
	    yourself)
    ]

    quote: aString [
	<category: 'adding-conveniance'>
	^self quote
	    contents: aString;
	    yourself
    ]

    radio [
	<category: 'adding-conveniance'>
	^self add: RadioButtonElement new
    ]

    reset [
	<category: 'adding-conveniance'>
	^self input
	    beReset;
	    yourself
    ]

    script [
	<category: 'adding-conveniance'>
	^self add: ScriptElement new
    ]

    script: aString [
	<category: 'adding-conveniance'>
	^self script
	    contents: aString;
	    yourself
    ]

    select [
	<category: 'adding-conveniance'>
	^self add: SelectElement new
    ]

    small [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'small';
	    yourself)
    ]

    small: aString [
	<category: 'adding-conveniance'>
	^self small
	    contents: aString;
	    yourself
    ]

    space [
	<category: 'adding-conveniance'>
	^self text: ' '
    ]

    span [
	<category: 'adding-conveniance'>
	^self add: SpanElement new
    ]

    strong [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'strong';
	    yourself)
    ]

    strong: aString [
	<category: 'adding-conveniance'>
	^self strong
	    contents: aString;
	    yourself
    ]

    stylesheet [
	<category: 'adding-conveniance'>
	^self link
	    beStylesheet;
	    yourself
    ]

    submit [
	<category: 'adding-conveniance'>
	^self input
	    beSubmit;
	    yourself
    ]

    subscript [
	<category: 'adding-conveniance'>
	^self add: (TextElement new
	    tag: 'subscript';
	    yourself)
    ]

    subscript: aString [
	<category: 'adding-conveniance'>
	^self subscript
	    contents: aString;
	    yourself
    ]

    superscript [
	<category: 'adding-conveniance'>
	^self add: (TextElement new
	    tag: 'superscript';
	    yourself)
    ]

    superscript: aString [
	<category: 'adding-conveniance'>
	^self superscript
	    contents: aString;
	    yourself
    ]

    table [
	<category: 'adding-conveniance'>
	^self add: TableElement new
    ]

    tbody [
	<category: 'adding-conveniance'>
	^self add: TableBodyElement new
    ]

    td [
	<category: 'adding-conveniance'>
	^self add: TableDataElement new
    ]

    tfoot [
	<category: 'adding-conveniance'>
	^self add: TableFootElement new
    ]

    thead [
	<category: 'adding-conveniance'>
	^self add: TableHeadElement new
    ]

    th [
	<category: 'adding-conveniance'>
	^self add: TableHeaderElement new
    ]

    tr [
	<category: 'adding-conveniance'>
	^self add: TableRowElement new
    ]

    tt [
	<category: 'adding-conveniance'>
	^self add: (TextElement new 
	    tag: 'tt';
	    yourself)
    ]

    textarea [
	<category: 'adding-conveniance'>
	^self add: TextAreaElement new
    ]

    ul [
	<category: 'adding-conveniance'>
	^self
	    add: (ListElement new beUnordered;
	    yourself)
    ]

    var [
	<category: 'adding-conveniance'>
	^self add: (TextElement new
	    tag: 'var';
	    yourself)
    ]

    var: aString [
	<category: 'adding-conveniance'>
	^self var
	    contents: aString;
	    yourself
    ]

    css [
	<category: 'deprecated'>
	^self stylesheet
    ]

]

