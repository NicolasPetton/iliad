"======================================================================
|
|   Iliad.ILLinkableElement class definition
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



ILHTMLBuilderElement subclass: ILLinkableElement [

    <comment: nil>
    <category: 'Iliad-Core-XHTMLElements'>

    accesskey: aCharacter [
	<category: 'accessing attributes'>
	self attributeAt: 'accesskey' put: aCharacter greaseString
    ]

    charset: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'charset' put: aString
    ]

    contentType: aString [
	<category: 'accessing attributes'>
	self type: aString
    ]

    href: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'href' put: aString
    ]

    hreflang: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'hreflang' put: aString
    ]

    target: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'target' put: aString
    ]

    linkToLocal: aString [
	<category: 'accessing attributes'>
	self linkToApplication: self application class controller: aString
    ]

    linkToApplication: anApplicationClass [
	<category: 'accessing attributes'>
	self linkToApplication: anApplicationClass controller: ''
    ]

    linkToApplication: anApplicationClass controller: aString [
	<category: 'accessing attributes'>
	self href: ((self context urlBuilder absolutePathFor: anApplicationClass) addToPath: aString)
    ]

    type: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'type' put: aString
    ]

    beAlternate [
	<category: 'accessing attributes-relationships'>
	self rel: 'Alternate'
    ]

    beAppendix [
	<category: 'accessing attributes-relationships'>
	self rel: 'Appendix'
    ]

    beBookmark [
	<category: 'accessing attributes-relationships'>
	self rel: 'Bookmark'
    ]

    beChapter [
	<category: 'accessing attributes-relationships'>
	self rel: 'Chapter'
    ]

    beContents [
	<category: 'accessing attributes-relationships'>
	self rel: 'Contents'
    ]

    beCopyright [
	<category: 'accessing attributes-relationships'>
	self rel: 'Copyright'
    ]

    beFavicon [
	<category: 'accessing attributes-relationships'>
	self rel: 'shortcut icon'
    ]

    beGlossary [
	<category: 'accessing attributes-relationships'>
	self rel: 'Glossary'
    ]

    beHelp [
	<category: 'accessing attributes-relationships'>
	self rel: 'Help'
    ]

    beIndex [
	<category: 'accessing attributes-relationships'>
	self rel: 'Index'
    ]

    beNext [
	<category: 'accessing attributes-relationships'>
	self rel: 'Next'
    ]

    bePrev [
	<category: 'accessing attributes-relationships'>
	self rel: 'Prev'
    ]

    bePrevious [
	<category: 'accessing attributes-relationships'>
	self rel: 'Prev'
    ]

    beRss [
	<category: 'accessing attributes-relationships'>
	self rel: 'alternate'.
	self type: 'application/rss+xml'
    ]

    beSection [
	<category: 'accessing attributes-relationships'>
	self rel: 'Section'
    ]

    beStart [
	<category: 'accessing attributes-relationships'>
	self rel: 'Start'
    ]

    beStylesheet [
	<category: 'accessing attributes-relationships'>
	self rel: 'Stylesheet'.
	self type: 'text/css'
    ]

    beSubsection [
	<category: 'accessing attributes-relationships'>
	self rel: 'Subsection'
    ]

    rel: aString [
	<category: 'accessing attributes-relationships'>
	self attributeAt: 'rel' put: aString
    ]
    fromAlternate [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Alternate'
    ]

    fromAppendix [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Appendix'
    ]

    fromBookmark [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Bookmark'
    ]

    fromChapter [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Chapter'
    ]

    fromContents [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Contents'
    ]

    fromCopyright [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Copyright'
    ]

    fromGlossary [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Glossary'
    ]

    fromHelp [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Help'
    ]

    fromIndex [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Index'
    ]

    fromNext [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Next'
    ]

    fromPrev [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Prev'
    ]

    fromPrevious [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Prev'
    ]

    fromSection [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Section'
    ]

    fromStart [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Start'
    ]

    fromStylesheet [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Stylesheet'
    ]

    fromSubsection [
	<category: 'accessing attributes-reverse links'>
	self rev: 'Subsection'
    ]

    rev: aString [
	<category: 'accessing attributes-reverse links'>
	self attributeAt: 'rev' put: aString
    ]
]

