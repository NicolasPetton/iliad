"======================================================================
|
|   Iliad.ILHTMLBuilderElement class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
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



ILElement subclass: ILHTMLBuilderElement [
    
    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    contentType [
	<category: 'accessing'>
	^'text/html; charset=', self session charset
    ]

    title [
	<category: 'accessing attributes'>
	^self attributeAt: 'title'
    ]

    title: aString [
	<category: 'accessing attributes'>
	^self attributeAt: 'title' put: aString
    ]


    cssClass: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'class' put: aString
    ]

    cssClass [
	<category: 'accessing attributes'>
	^self attributeAt: 'class'
    ]

    class: aString [
	<category: 'accessing'>
	self cssClass: aString
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
	^self attributeAt: 'style' put: aString  
    ]

    onBlur: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'blur' add: aString
    ]

    onChange: aString [
	<category: 'accessing  attributes-events'>
	self onEvent: 'change' add: aString
    ]

    onClick: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'click' add: aString
    ]

    onDoubleClick: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'dblclick' add: aString
    ]

    onFocus: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'focus' add: aString
    ]

    onKeyDown: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'keydown' add: aString
    ]

    onKeyPress: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'keypress' add: aString
    ]

    onKeyUp: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'keyup' add: aString
    ]

    onMouseOut: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'mouseout' add: aString
    ]

    onMouseOver: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'mouseover' add: aString
    ]

    onSelect: aString [
	<category: 'accessing attributes-events'>
	self onEvent: 'select' add: aString
    ]

    onBlurDo: aBlock [
	<category: 'accessing attributes-events'>
	self onEvent: 'blur' do: aBlock
    ]

    onChangeDo: aBlock [
	<category: 'accessing  attributes-events'>
	self onEvent: 'change' do: aBlock
    ]

    onClickDo: aBlock [
	<category: 'accessing attributes-events'>
	self onEvent: 'click' do: aBlock
    ]

    onDoubleClickDo: aBlock [
	<category: 'accessing attributes-events'>
	self onEvent: 'dblclick' do: aBlock
    ]

    onFocusDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'focus' do: aBlock
    ]

    onKeyDownDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'keydown' do: aBlock
    ]

    onKeyPressDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'keypress' do: aBlock
    ]

    onKeyUpDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'keyup' do: aBlock
    ]

    onMouseOutDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'mouseout' do: aBlock
    ]

    onMouseOverDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'mouseover' do: aBlock
    ]

    onSelectDo: aBlock [
	<categoryDo: 'accessing attributes-events'>
	self onEvent: 'select' do: aBlock
    ]

    onEvent: aString add: anotherString [
	<category: 'accessing attributes-events'>
	| oldString |
	oldString := (self attributeAt: 'on', aString) ifNil: [''].
	self attributeAt: 'on', aString put: (oldString, anotherString)
    ]

    onEvent: aString do: aBlock [
	<category: 'accessing attributes-events'>
	| actionUrl |
	actionUrl := (self context urlBuilder urlForAction: 
	    (self session registerActionFor: aBlock)) greaseString.
	self 
	    onEvent: aString 
	    add: 'iliad.evaluateAction("', actionUrl, '");'
    ]

    a [
	<category: 'adding-convenience'>
	^self add: ILAnchorElement new
    ]

    area [
	<category: 'adding-convenience'>
	^self add: ILAreaElement new
    ]

    bdo [
	<category: 'adding-convenience'>
	^self add: ILDirectionElement new
    ]

    big [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'big';
	    yourself)
    ]

    big: aString [
	<category: 'adding-convenience'>
	^self big
	    contents: aString;
	    yourself
    ]

    blockquote [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'blockquote';
	    yourself)
    ]

    blockquote: aString [
	<category: 'adding-convenience'>
	^self blockquote
	    contents: aString;
	    yourself
    ]

    b [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'b';
	    yourself)
    ]

    b: aString [
	<category: 'adding-convenience'>
	^self b
	    contents: aString;
	    yourself
    ]

    br [
	<category: 'adding-convenience'>
	^self add: ILBreakElement new
    ]

    button [
	<category: 'adding-convenience'>
	^self add: ILButtonElement new
    ]

    checkbox [
	<category: 'adding-convenience'>
	^self add: ILCheckboxElement new
    ]

    cite [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'cite';
	    yourself)
    ]

    cite: aString [
	<category: 'adding-convenience'>
	^self cite
	    contents: aString;
	    yourself
    ]

    code [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'code';
	    yourself)
    ]

    code: aString [
	<category: 'adding-convenience'>
	^self code
	    contents: aString;
	    yourself
    ]

    dd [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'dd';
	    yourself)
    ]

    dfn [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'dfn';
	    yourself)
    ]

    dl [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'dl';
	    yourself)
    ]

    dt [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'dt';
	    yourself)
    ]

    div [
	<category: 'adding-convenience'>
	^self add: ILDivElement new
    ]

    em [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'em';
	    yourself)
    ]

    em: aString [
	<category: 'adding-convenience'>
	^self em
	    contents: aString;
	    yourself
    ]

    favicon [
	<category: 'adding-convenience'>
	^self link
	    beFavicon;
	    yourself
    ]

    favicon: aString [
	<category: 'adding-convenience'>
	^self favicon
	    href: aString;
	    yourself
    ]

    fieldset [
	<category: 'adding-convenience'>
	^self add: ILFieldsetElement new
    ]

    file [
	<category: 'adding-convenience'>
	^self input
	    beFile;
	    yourself
    ]

    form [
	<category: 'adding-convenience'>
	^self add: ILFormElement new
    ]

    h1 [
	<category: 'adding-convenience'>
	^self add: (ILHeadingElement new
	    level: 1;
	    yourself)
    ]

    h1: aString [
	<category: 'adding-convenience'>
	^self h1
	    text: aString;
	    yourself
    ]

    h2 [
	<category: 'adding-convenience'>
	^self add: (ILHeadingElement new
	    level: 2;
	    yourself)
    ]

    h2: aString [
	<category: 'adding-convenience'>
	^self h2
	    text: aString;
	    yourself
    ]

    h3 [
	<category: 'adding-convenience'>
	^self add: (ILHeadingElement new
	    level: 3;
	    yourself)
    ]

    h3: aString [
	<category: 'adding-convenience'>
	^self h3
	    text: aString;
	    yourself
    ]

    h4 [
	<category: 'adding-convenience'>
	^self add: (ILHeadingElement new
	    level: 4;
	    yourself)
    ]

    h4: aString [
	<category: 'adding-convenience'>
	^self h4
	    text: aString;
	    yourself
    ]

    h5 [
	<category: 'adding-convenience'>
	^self add: (ILHeadingElement new
	    level: 5;
	    yourself)
    ]

    h5: aString [
	<category: 'adding-convenience'>
	^self h5
	    text: aString;
	    yourself
    ]

    h6 [
	<category: 'adding-convenience'>
	^self add: (ILHeadingElement new
	    level: 6;
	    yourself)
    ]

    h6: aString [
	<category: 'adding-convenience'>
	^self h6
	    text: aString;
	    yourself
    ]

    h [
	<category: 'adding-convenience'>
	^self add: ILHeadingElement new
    ]

    hr [
	<category: 'adding-convenience'>
	^self add: ILHorizontalRuleElement new
    ]

    html: aString [
	<category: 'adding-convenience'>
	^self add: (ILRawHtmlElement new
	    contents: aString;
	    yourself)
    ]

    if [
	<category: 'accessing'>
	^self add: (ILConditionalCommentElement new)
    ]

    img [
	<category: 'adding-convenience'>
	^self add: ILImageElement new
    ]

    img: aString [
	<category: 'adding-convenience'>
	^self img
	    src: aString;
	    yourself
    ]

    input [
	<category: 'adding-convenience'>
	^self add: ILInputElement new
    ]

    i [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'i';
	    yourself)
    ]

    i: aString [
	<category: 'adding-convenience'>
	^self i
	    contents: aString;
	    yourself
    ]

    javascript [
	<category: 'adding-convenience'>
	^self script
	    beJavascript;
	    yourself
    ]

    label [
	<category: 'adding-convenience'>
	^self add: ILLabelElement new
    ]

    legend [
	<category: 'adding-convenience'>
	^self add: ILLegendElement new
    ]

    legend: aString [
	<category: 'adding-convenience'>
	^self legend
	    text: aString;
	    yourself
    ]

    link [
	<category: 'adding-conveenience'>
	^self add: ILLinkElement new
    ]

    li [
	<category: 'adding-convenience'>
	^self add: ILListItemElement new
    ]

    map [
	<category: 'adding-convenience'>
	^self add: ILMapElement new
    ]

    meta [
	<category: 'adding-convenience'>
	^self add: ILMetaElement new
    ]

    nbsp [
	^self add: (ILRawHtmlElement new 
	    contents: '&nbsp;'; 
	    yourself)
    ]

    object [
	<category: 'adding-convenience'>
	^self add: ILObjectElement new
    ]

    option [
	<category: 'adding-convenience'>
	^self add: ILOptionElement new
    ]

    optgroup [
	<category: 'adding-convenience'>
	^self add: ILOptionGroupElement new
    ]
    
    ol [
	<category: 'adding-convenience'>
	^self add: (ILListElement new 
	    beOrdered;
	    yourself)
    ]

    p [
	<category: 'adding-convenience'>
	^self add: ILParagraphElement new
    ]

    param [
	<category: 'adding-convenience'>
	^self add: ILParameterElement new
    ]

    password [
	<category: 'adding-convenience'>
	^self input
	    bePassword;
	    yourself
    ]

    pre [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'pre';
	    yourself)
    ]

    pre: aString [
	<category: 'adding-convenience'>
	^self pre
	    contents: aString;
	    yourself
    ]

    quote [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'quote';
	    yourself)
    ]

    quote: aString [
	<category: 'adding-convenience'>
	^self quote
	    contents: aString;
	    yourself
    ]

    radio [
	<category: 'adding-convenience'>
	^self add: ILRadioButtonElement new
    ]

    reset [
	<category: 'adding-convenience'>
	^self input
	    beReset;
	    yourself
    ]

    script [
	<category: 'adding-convenience'>
	^self add: ILScriptElement new
    ]

    script: aString [
	<category: 'adding-convenience'>
	^self script
	    contents: aString;
	    yourself
    ]

    select [
	<category: 'adding-convenience'>
	^self add: ILSelectElement new
    ]

    small [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'small';
	    yourself)
    ]

    small: aString [
	<category: 'adding-convenience'>
	^self small
	    contents: aString;
	    yourself
    ]

    space [
	<category: 'adding-convenience'>
	^self text: ' '
    ]

    span [
	<category: 'adding-convenience'>
	^self add: ILSpanElement new
    ]

    strong [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'strong';
	    yourself)
    ]

    strong: aString [
	<category: 'adding-convenience'>
	^self strong
	    contents: aString;
	    yourself
    ]

    stylesheet [
	<category: 'adding-convenience'>
	^self link
	    beStylesheet;
	    yourself
    ]

    submit [
	<category: 'adding-convenience'>
	^self input
	    beSubmit;
	    yourself
    ]

    subscript [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new
	    tag: 'subscript';
	    yourself)
    ]

    subscript: aString [
	<category: 'adding-convenience'>
	^self subscript
	    contents: aString;
	    yourself
    ]

    superscript [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new
	    tag: 'superscript';
	    yourself)
    ]

    superscript: aString [
	<category: 'adding-convenience'>
	^self superscript
	    contents: aString;
	    yourself
    ]

    table [
	<category: 'adding-convenience'>
	^self add: ILTableElement new
    ]

    tbody [
	<category: 'adding-convenience'>
	^self add: ILTableBodyElement new
    ]

    td [
	<category: 'adding-convenience'>
	^self add: ILTableDataElement new
    ]

    tfoot [
	<category: 'adding-convenience'>
	^self add: ILTableFootElement new
    ]

    thead [
	<category: 'adding-convenience'>
	^self add: ILTableHeadElement new
    ]

    th [
	<category: 'adding-convenience'>
	^self add: ILTableHeaderElement new
    ]

    tr [
	<category: 'adding-convenience'>
	^self add: ILTableRowElement new
    ]

    tt [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new 
	    tag: 'tt';
	    yourself)
    ]

    textarea [
	<category: 'adding-convenience'>
	^self add: ILTextAreaElement new
    ]

    ul [
	<category: 'adding-convenience'>
	^self
	    add: (ILListElement new beUnordered;
	    yourself)
    ]

    var [
	<category: 'adding-convenience'>
	^self add: (ILTextElement new
	    tag: 'var';
	    yourself)
    ]

    var: aString [
	<category: 'adding-convenience'>
	^self var
	    contents: aString;
	    yourself
    ]
]

