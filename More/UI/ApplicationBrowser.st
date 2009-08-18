"======================================================================
|
|   Iliad.ApplicationBrowser class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
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



Application subclass: ApplicationBrowser [
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    ApplicationBrowser class >> path [
	<category: 'accessing'>
	^'browse'
    ]

    applications [
	<category: 'accessing'>
	^((Application allSubclasses select: [:each | each path notEmpty]) 
	    reject: [:each | each = self class]) 
		asSortedCollection: [:a :b | a name < b name]
    ]

    pathFor: anApplication [
	<category: 'accessing'>
	^Dispatcher current absolutePathFor: anApplication
    ]

    index [
	<category: 'views'>
	^
	[:e | 
	e image source: '/images/iliad.png' alternativeText: 'Iliad'.
	e h3: 'Application Browser'.
	e build: self pathListContents]
    ]

    pathListContents [
	<category: 'views-parts'>
	^
	[:e | 
	| ul |
	ul := e unorderedList.
	self applications do: 
		[:each | 
		(ul listItem anchor)
		    text: each name;
		    linkTo: (self pathFor: each)]]
    ]

    updatePage: aPage [
	<category: 'building'>
	super updatePage: aPage.
	aPage head stylesheet href: '/stylesheets/iliad.css'
    ]
]

