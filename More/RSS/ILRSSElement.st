"======================================================================
|
|   Iliad.ILRSSElement class definition
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


ILElement subclass: ILRSSElement [
    | tag |
    
    <comment: nil>
    <category: 'Iliad-More-RSS'>

    contentType [
	<category: 'accessing'>
	^'application/rss+xml'
    ]

    enclosure [
	<category: 'accessing'>
	^self add: ILRSSEnclosureElement new
    ]

    source [
	<category: 'accessing'>
	^self add: ILRSSSourceElement new
    ]

    source: aString [
	<category: 'accessing'>
	^self source
	    text: aString;
	    yourself
    ]

    tag [
	<category: 'accessing'>
	^tag
    ]

    tag: aString [
	<category: 'accessing'>
	tag := aString
    ]

    author [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'author';
	    yourself)
    ]

    author: aString [
	<category: 'adding-convenience'>
	^self author
	    text: aString;
	    yourself
    ]

    category [
	<category: 'adding-convenience'>
	^self add: ILRSSCategoryElement new
    ]

    category: aString [
	<category: 'adding-convenience'>
	^self category
	    text: aString;
	    yourself
    ]

    channel [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'channel';
	    yourself)
    ]

    cloud [
	<category: 'adding-convenience'>
	^self add: ILRSSCloudElement new
    ]

    comment [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'wfw:comment';
	    yourself)
    ]

    comment: aString [
	<category: 'adding-convenience'>
	^self comment
	    text: aString;
	    yourself
    ]

    comments [
	<category: 'adding-convenience'>
	^self add: ILRSSCommentsElement new
    ]

    comments: anUrl [
	<category: 'adding-convenience'>
	^self comments
	    text: anUrl;
	    yourself
    ]

    copyright [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'copyright';
	    yourself)
    ]

    copyright: aString [
	<category: 'adding-convenience'>
	^self copyright
	    text: aString;
	    yourself
    ]

    description [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'description';
	    yourself)
    ]

    description: aString [
	<category: 'adding-convenience'>
	^self description
	    text: aString;
	    yourself
    ]

    generator [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'generator';
	    yourself)
    ]

    generator: aString [
	<category: 'adding-convenience'>
	^self generator
	    text: aString;
	    yourself
    ]

    guid [
	<category: 'adding-convenience'>
	^self add: ILRSSGuidElement new
    ]

    guid: anUrl [
	<category: 'adding-convenience'>
	^self guid text: anUrl yourself
    ]

    image [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'image';
	    yourself)
    ]

    image: aString [
	<category: 'adding-convenience'>
	^self image
	    text: aString;
	    yourself
    ]

    item [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'item';
	    yourself)
    ]

    language [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'language';
	    yourself)
    ]

    language: aString [
	<category: 'adding-convenience'>
	^self language
	    text: aString;
	    yourself
    ]

    lastBuildDate [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'lastBuildDate';
	    yourself)
    ]

    lastBuildDate: aDate [
	<category: 'adding-convenience'>
	^self lastBuildDate
	    text: ((Grease.GRPinter rfc822WithTimeZone: 'GMT') print: (DateTime fromDays: aDate days));
	    yourself
    ]

    link [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'link';
	    yourself)
    ]

    link: aString [
	<category: 'adding-convenience'>
	^self link
	    text: aString;
	    yourself
    ]

    managingEditor [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'managingEditor';
	    yourself)
    ]

    managingEditor: aString [
	<category: 'adding-convenience'>
	^self managingEditor
	    text: aString;
	    yourself
    ]

    pubDate [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'pubDate';
	    yourself)
    ]

    pubDate: aDate [
	<category: 'adding-convenience'>
	^self pubDate
	    text: ((Grease.GRPrinter rfc822WithTimeZone: 'GMT') print: (DateTime fromDays: aDate days));
	    yourself
    ]

    rating [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'rating';
	    yourself)
    ]

    rating: aString [
	<category: 'adding-convenience'>
	^self rating
	    text: aString;
	    yourself
    ]

    rss [
	<category: 'adding-convenience'>
	^self add: ILRSSRssElement new
    ]

    skipDays [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'skipDays';
	    yourself)
    ]

    skipDays: aString [
	<category: 'adding-convenience'>
	^self skipDays
	    text: aString;
	    yourself
    ]

    skipHours [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'skipHours';
	    yourself)
    ]

    skipHours: aString [
	<category: 'adding-convenience'>
	^self skipHours
	    text: aString;
	    yourself
    ]

    textInput [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'textInput';
	    yourself)
    ]

    textInput: aString [
	<category: 'adding-convenience'>
	^self textInput
	    text: aString;
	    yourself
    ]

    title [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'title';
	    yourself)
    ]

    title: aString [
	<category: 'adding-convenience'>
	^self title
	    text: aString;
	    yourself
    ]

    ttl [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'ttl';
	    yourself)
    ]

    ttl: aString [
	<category: 'adding-convenience'>
	^self ttl
	    text: aString;
	    yourself
    ]

    webMaster [
	<category: 'adding-convenience'>
	^self add: (ILRSSElement new
	    tag: 'webMaster';
	    yourself)
    ]

    webMaster: aString [
	<category: 'adding-convenience'>
	^self webMaster
	    text: aString;
	    yourself
    ]
]

