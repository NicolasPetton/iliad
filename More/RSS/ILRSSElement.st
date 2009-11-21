"======================================================================
|
|   Iliad.ILRSSElement class definition
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
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'author';
	    yourself)
    ]

    author: aString [
	<category: 'adding-conveniance'>
	^self author
	    text: aString;
	    yourself
    ]

    category [
	<category: 'adding-conveniance'>
	^self add: ILRSSCategoryElement new
    ]

    category: aString [
	<category: 'adding-conveniance'>
	^self category
	    text: aString;
	    yourself
    ]

    channel [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'channel';
	    yourself)
    ]

    cloud [
	<category: 'adding-conveniance'>
	^self add: ILRSSCloudElement new
    ]

    comment [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'wfw:comment';
	    yourself)
    ]

    comment: aString [
	<category: 'adding-conveniance'>
	^self comment
	    text: aString;
	    yourself
    ]

    comments [
	<category: 'adding-conveniance'>
	^self add: ILRSSCommentsElement new
    ]

    comments: anUrl [
	<category: 'adding-conveniance'>
	^self comments
	    text: anUrl;
	    yourself
    ]

    copyright [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'copyright';
	    yourself)
    ]

    copyright: aString [
	<category: 'adding-conveniance'>
	^self copyright
	    text: aString;
	    yourself
    ]

    description [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'description';
	    yourself)
    ]

    description: aString [
	<category: 'adding-conveniance'>
	^self description
	    text: aString;
	    yourself
    ]

    generator [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'generator';
	    yourself)
    ]

    generator: aString [
	<category: 'adding-conveniance'>
	^self generator
	    text: aString;
	    yourself
    ]

    guid [
	<category: 'adding-conveniance'>
	^self add: ILRSSGuidElement new
    ]

    guid: anUrl [
	<category: 'adding-conveniance'>
	^self guid text: anUrl yourself
    ]

    image [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'image';
	    yourself)
    ]

    image: aString [
	<category: 'adding-conveniance'>
	^self image
	    text: aString;
	    yourself
    ]

    item [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'item';
	    yourself)
    ]

    language [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'language';
	    yourself)
    ]

    language: aString [
	<category: 'adding-conveniance'>
	^self language
	    text: aString;
	    yourself
    ]

    lastBuildDate [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'lastBuildDate';
	    yourself)
    ]

    lastBuildDate: aDate [
	<category: 'adding-conveniance'>
	^self lastBuildDate
	    text: (ILSupport rfc1123StringFor: aDate asTimeStamp);
	    yourself
    ]

    link [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'link';
	    yourself)
    ]

    link: aString [
	<category: 'adding-conveniance'>
	^self link
	    text: aString;
	    yourself
    ]

    managingEditor [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'managingEditor';
	    yourself)
    ]

    managingEditor: aString [
	<category: 'adding-conveniance'>
	^self managingEditor
	    text: aString;
	    yourself
    ]

    pubDate [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'pubDate';
	    yourself)
    ]

    pubDate: aDate [
	<category: 'adding-conveniance'>
	^self pubDate
	    text: (ILSupport rfc1123StringFor: aDate asTimeStamp);
	    yourself
    ]

    rating [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'rating';
	    yourself)
    ]

    rating: aString [
	<category: 'adding-conveniance'>
	^self rating
	    text: aString;
	    yourself
    ]

    rss [
	<category: 'adding-conveniance'>
	^self add: ILRSSRssElement new
    ]

    skipDays [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'skipDays';
	    yourself)
    ]

    skipDays: aString [
	<category: 'adding-conveniance'>
	^self skipDays
	    text: aString;
	    yourself
    ]

    skipHours [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'skipHours';
	    yourself)
    ]

    skipHours: aString [
	<category: 'adding-conveniance'>
	^self skipHours
	    text: aString;
	    yourself
    ]

    textInput [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'textInput';
	    yourself)
    ]

    textInput: aString [
	<category: 'adding-conveniance'>
	^self textInput
	    text: aString;
	    yourself
    ]

    title [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'title';
	    yourself)
    ]

    title: aString [
	<category: 'adding-conveniance'>
	^self title
	    text: aString;
	    yourself
    ]

    ttl [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'ttl';
	    yourself)
    ]

    ttl: aString [
	<category: 'adding-conveniance'>
	^self ttl
	    text: aString;
	    yourself
    ]

    webMaster [
	<category: 'adding-conveniance'>
	^self add: (ILRSSElement new
	    tag: 'webMaster';
	    yourself)
    ]

    webMaster: aString [
	<category: 'adding-conveniance'>
	^self webMaster
	    text: aString;
	    yourself
    ]
]

