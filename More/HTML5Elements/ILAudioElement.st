"======================================================================
|
|   Iliad.ILAudioElement class definition
|
 ======================================================================"

"======================================================================
| Copyright (c) 2008  Berto 'd Sera for Vox Humanitatis <berto.d.sera@gmail.com>
| X11 license (often called MIT)
| ----------------------------------------------------------------
| Permission is hereby granted, free of charge, to any person
| obtaining a copy of this software and associated documentation
| files (the 'Software'), to deal in the Software without
| restriction, including without limitation the rights to use,
| copy, modify, merge, publish, distribute, sublicense, and/or sell
| copies of the Software, and to permit persons to whom the
| Software is furnished to do so, subject to the following
| conditions:
| The above copyright notice and this permission notice shall be
| included in all copies or substantial portions of the Software.
| THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
| EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
| OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
| NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
| HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
| WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
| FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
| OTHER DEALINGS IN THE SOFTWARE.
 ======================================================================"



ILHTMLBuilderElement subclass: ILAudioElement [
    <category: 'Iliad-More-HTML5Elements'>
    <comment: 'version 0.6.0.
    This class implements an HTML5 .ogv audio streaming tag. This is
    EXPERIMENTAL code, and it is currently expected to work ONLY on FF 3.5 or higher.
    Specs at http://www.w3.org/TR/html5/video.html.
    An audio element represents an audio stream' >

    tag [
	<category: 'accessing'>
	^'audio'
    ]

    src: aString [
	<category: 'accessing attributes'>
	self attributeAt: 'src' put: aString
    ]

    controls: aBoolean [
	<category: 'accessing attributes'>
	aBoolean ifTrue: [
	    self attributeAt: 'controls' put: 'controls']
    ]

    preloadNone [
	<category: 'accessing attributes'>
	self attributeAt: 'preload' put: 'none'
    ]

    preloadMetadata [
	<category: 'accessing attributes'>
	self attributeAt: 'preload' put: 'metadata'
    ]

    preloadAuto [
	<category: 'accessing attributes'>
	self attributeAt: 'preload' put: 'auto'
    ]

    autoplay: aBoolean [
	<category: 'accessing attributes'>
	aBoolean ifTrue: [
	    self attributeAt: 'autoplay' put: 'autoplay']
    ]

    loop: aBoolean [
	<category: 'accessing attributes'>
	aBoolean ifTrue: [
	    self attributeAt: 'loop' put: 'loop']
    ]
]
