"======================================================================
|
|   Iliad.ILBlogApplication class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
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



ILApplication subclass: ILBlogApplication [
    |postsWidgets|

    <comment: nil>
    <category: 'Iliad-More-Examples'>

    ILBlogApplication class >> path [
	^'/examples/blog'
    ]

    initialize [
	<category: 'initialization'>
	super initialize.
	model := ILBlogRepository default
    ]

    postsWidgets [
	<category: 'accessing'>
	^postsWidgets ifNil: [postsWidgets := Dictionary new]
    ]

    postWidgetFor: aPost [
	<category: 'accessing'>
	^self postsWidgets at: aPost ifAbsentPut: [
	    aPost asWidget
		addValidatedSwitch;
		yourself]
    ]

    actionsContents [
	<category: 'building'>
	^[:e | 
	    | div |
	    div := (e div)
		class: 'actions';
		yourself.
	    div a
		text: 'new post';
		action: [self addPost]]
    ]

    postContentsFor: aPost [
	<category: 'building'>
	^[:e | 
	    e h2 a
		text: aPost title;
		action: [self redirectToLocal: 'post/', aPost title, aPost hash printString].
	    e build: (self postWidgetFor: aPost)]
    ]

    postsContents [
	<category: 'building'>
	^[:e | 
	    e h1: 'Blog Example'.
	    e build: self actionsContents.
	    (self model posts asSortedCollection: [:a :b | a timestamp > b timestamp]) 
		do: [:each | e build: (self postContentsFor: each)]]
    ]

    addPost [
	<category: 'actions'>
	self redirectToLocal: #add.
    ]

    index [
	<category: 'controllers'>
	^self posts
    ]

    post [
	"Controller for a specific post"
	<category: 'controllers'>
	
	| post path |
	path := self route next.
	post := self model posts 
	    detect: [:each | (each title , each hash printString) = path]
	    ifNone: [self redirectToIndex].
	^self postContentsFor: post
    ]

    posts [
	<category: 'controllers'>
	^self postsContents
    ]

    add [
	<category: 'controllers'>
	^(ILBlogPost new asWidget
	    addValidatedForm;
	    yourself) addMessage: [:e | e h3:'Add new post']
	    "onAnswer: [:ans | ans ifNotNil: [self model posts add: ans]]"
    ]
    
    updatePage: aPage [
	<category: 'building'>
	super updatePage: aPage.
	aPage head stylesheet href: '/stylesheets/iliad.css'
    ]
]

