"======================================================================
|
|   Iliad.ILApplicationBrowser class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2010 
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



ILApplication subclass: ILApplicationBrowser [
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    ILApplicationBrowser class >> path [
	<category: 'accessing'>
	^'browse'
    ]

    applications [
	<category: 'accessing'>
	^((ILApplication allSubclasses select: [:each | each path notEmpty]) 
	    reject: [:each | each = self class]) 
		asSortedCollection: [:a :b | a name < b name]
    ]

    index [
	<category: 'controllers'>
	^self mainContents
    ]

    mainContents [
	<category: 'building'>
	^[:e | 
	    e img src: '/images/iliad.png' alt: 'Iliad'.
	    e h3: 'Application Browser'.
	    e build: self pathListContents]
    ]

    pathListContents [
	<category: 'building'>
	^[:e || ul |
	    ul := e ul.
	    self applications do: [:each | 
		ul li a
		    text: each name;
		    linkToApplication: each]]
    ]

    updatePage: aPage [
	<category: 'building'>
	super updatePage: aPage.
	aPage head stylesheet href: '/stylesheets/iliad.css'
    ]
]

