"======================================================================
|
|   Iliad.ILBlogPost class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
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



ILObject subclass: ILBlogPost [
    | title body comments timestamp |
    
    <category: 'Iliad-More-Examples'>
    <comment: nil>

    ILBlogPost class >> descriptionBody [
	^Magritte.MAMemoDescription new
	    priority: 3;
	    accessor: #body;
	    label: 'Body';
	    beRequired;
	    yourself
    ]

    ILBlogPost class >> descriptionTimestamp [
	^Magritte.MATimeStampDescription new
	    priority: 2;
	    accessor: #timestamp;
	    label: 'Publication date';
	    beRequired;
	    yourself
    ]

    ILBlogPost class >> descriptionTitle [
	^Magritte.MAStringDescription new
	    priority: 1;
	    accessor: #title;
	    label: 'Title';
	    beRequired;
	    yourself
    ]

    body [
	<category: 'accessing'>
	^body
    ]

    body: aString [
	<category: 'accessing'>
	body := aString
    ]

    title [
	<category: 'accessing'>
	^title
    ]

    title: aString [
	<category: 'accessing'>
	title := aString
    ]

    initialize [
	<category: 'initialization'>
	super initialize.
	title := ''.
	body := ''.
	comments := OrderedCollection new.
	timestamp := DateTime now
    ]

    timestamp [
	<category: 'accessing'>
	^timestamp
    ]

    timestamp: anObject [
	<category: 'accessing'>
	timestamp := anObject
    ]
]

