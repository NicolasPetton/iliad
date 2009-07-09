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

    anchor [
	<category: 'adding-conveniance'>
	^self add: AnchorElement new
    ]

    area [
	<category: 'adding-conveniance'>
	^self add: AreaElement new
    ]

    big [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new big;
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
	^self
	    add: (TextElement new blockquote;
	    yourself)
    ]

    blockquote: aString [
	<category: 'adding-conveniance'>
	^self blockquote
	    text: aString;
	    yourself
    ]

    bold [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new bold;
	    yourself)
    ]

    bold: aString [
	<category: 'adding-conveniance'>
	^self bold
	    text: aString;
	    yourself
    ]

    break [
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
	^self
	    add: (TextElement new cite;
	    yourself)
    ]

    cite: aString [
	<category: 'adding-conveniance'>
	^self cite
	    text: aString;
	    yourself
    ]

    code [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new code;
	    yourself)
    ]

    code: aString [
	<category: 'adding-conveniance'>
	^self code
	    text: aString;
	    yourself
    ]

    column [
	<category: 'adding-conveniance'>
	^self add: TableColumnElementElement new
    ]

    definition [
	<category: 'adding-conveniance'>
	^self
	    add: TextElement new definition;
	    yourself
    ]

    definitionData [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new definitionData;
	    yourself)
    ]

    definitionList [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new definitionList;
	    yourself)
    ]

    definitionTerm [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new definitionTerm;
	    yourself)
    ]

    direction [
	<category: 'adding-conveniance'>
	^self add: DirectionElement new
    ]

    div [
	<category: 'adding-conveniance'>
	^self add: DivElement new
    ]

    emphasis [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new emphasis;
	    yourself)
    ]

    emphasis: aString [
	<category: 'adding-conveniance'>
	^self emphasis
	    text: aString;
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

    fileInput [
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

    header [
	<category: 'adding-conveniance'>
	^self add: HeadingElement new
    ]

    horizontalRule [
	<category: 'adding-conveniance'>
	^self add: HorizontalRuleElement new
    ]

    html: aString [
	<category: 'adding-conveniance'>
	^self add: (RawHtmlElement new
	    contents: aString;
	    yourself)
    ]

    image [
	<category: 'adding-conveniance'>
	^self add: ImageElement new
    ]

    image: aString [
	<category: 'adding-conveniance'>
	^self image
	    source: aString;
	    yourself
    ]

    imageInput [
	<category: 'adding-conveniance'>
	^self input
	    beImage;
	    yourself
    ]

    input [
	<category: 'adding-conveniance'>
	^self add: InputElement new
    ]

    italic [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new italic;
	    yourself)
    ]

    italic: aString [
	<category: 'adding-conveniance'>
	^self italic
	    text: aString;
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
	<category: 'adding-conveniance'>
	^self add: LinkElement new
    ]

    listItem [
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

    optionGroup [
	<category: 'adding-conveniance'>
	^self add: OptionGroupElement new
    ]
    
    orderedList [
	<category: 'adding-conveniance'>
	^self
	    add: (ListElement new beOrdered;
	    yourself)
    ]

    paragraph [
	<category: 'adding-conveniance'>
	^self add: ParagraphElement new
    ]

    parameter [
	<category: 'adding-conveniance'>
	^self add: ParameterElement new
    ]

    password [
	<category: 'adding-conveniance'>
	^self input
	    bePassword;
	    yourself
    ]

    passwordInput [
	<category: 'adding-conveniance'>
	^self input
	    bePassword;
	    yourself
    ]

    preformatted [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new preformatted;
	    yourself)
    ]

    preformatted: aString [
	<category: 'adding-conveniance'>
	^self preformatted
	    contents: aString;
	    yourself
    ]

    quote [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new quote;
	    yourself)
    ]

    quote: aString [
	<category: 'adding-conveniance'>
	^self quote
	    text: aString;
	    yourself
    ]

    radioButton [
	<category: 'adding-conveniance'>
	^self add: RadioButtonElement new
    ]

    resetInput [
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
	^self
	    add: (TextElement new small;
	    yourself)
    ]

    small: aString [
	<category: 'adding-conveniance'>
	^self small
	    text: aString;
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
	^self
	    add: (TextElement new strong;
	    yourself)
    ]

    strong: aString [
	<category: 'adding-conveniance'>
	^self strong
	    text: aString;
	    yourself
    ]

    stylesheet [
	<category: 'adding-conveniance'>
	^self link
	    beStylesheet;
	    yourself
    ]

    submitInput [
	<category: 'adding-conveniance'>
	^self input
	    beSubmit;
	    yourself
    ]

    subscript [
	<category: 'adding-conveniance'>
	^self text
	    subscript;
	    yourself
    ]

    subscript: aString [
	<category: 'adding-conveniance'>
	^self subscript
	    text: aString;
	    yourself
    ]

    superscript [
	<category: 'adding-conveniance'>
	^self text
	    superscript;
	    yourself
    ]

    superscript: aString [
	<category: 'adding-conveniance'>
	^self superscript
	    text: aString;
	    yourself
    ]

    table [
	<category: 'adding-conveniance'>
	^self add: TableElement new
    ]

    tableBody [
	<category: 'adding-conveniance'>
	^self add: TableBodyElement new
    ]

    tableData [
	<category: 'adding-conveniance'>
	^self add: TableDataElement new
    ]

    tableFoot [
	<category: 'adding-conveniance'>
	^self add: TableFootElement new
    ]

    tableHead [
	<category: 'adding-conveniance'>
	^self add: TableHeadElement new
    ]

    tableHeader [
	<category: 'adding-conveniance'>
	^self add: TableHeaderElement new
    ]

    tableRow [
	<category: 'adding-conveniance'>
	^self add: TableRowElement new
    ]

    teletype [
	<category: 'adding-conveniance'>
	^self
	    add: (TextElement new teletype;
	    yourself)
    ]

    textArea [
	<category: 'adding-conveniance'>
	^self add: TextAreaElement new
    ]

    textInput [
	<category: 'adding-conveniance'>
	^self input
	    beText;
	    yourself
    ]

    title [
	<category: 'adding-conveniance'>
	^self attributeAt: 'title'
    ]

    title: aString [
	<category: 'adding-conveniance'>
	^self attributeAt: 'title' put: aString
    ]

    unorderedList [
	<category: 'adding-conveniance'>
	^self
	    add: (ListElement new beUnordered;
	    yourself)
    ]

    variable [
	<category: 'adding-conveniance'>
	^self text
	    variable;
	    yourself
    ]

    variable: aString [
	<category: 'adding-conveniance'>
	^self variable
	    text: aString;
	    yourself
    ]
]

