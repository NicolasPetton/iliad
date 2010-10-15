"======================================================================
|
|   Iliad.ILSourceElement class definition
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



ILHTMLBuilderElement subclass: ILSourceElement [

    <category: 'Iliad-More-HTML5Elements'>
    <comment: 'The source element enables multiple media sources to be 
    specified for audio and video elements'>

    tag [
	<category: 'accessing'>
	^'source'
    ]

    media: aString [
	"The intended media type of the media source (used for helping the UA
	determine, before fetching this media source, if it useful to the user)."

	<category: 'accessing attributes'>
	self attributeAt: 'media' put: aString
    ]

    type: aString [
	"The type of the media source (used for helping the UA determine, before
	fetching this media source, if it can play it)"

	<category: 'accessing attributes'>
	self attributeAt: 'type' put: aString
    ]

    src: aString [
	"The adress of the media source"

	<category: 'accessing attributes'>
	self attributeAt: 'src' put: aString
    ]
]

