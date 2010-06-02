"======================================================================
|
|    Smalltalk Classes extensions
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


ILHTMLBuilderElement extend [

    video [
	<category: '*Iliad-More-HTML5'>
	^self add: ILVideoElement new
    ]

    audio [
	<category: '*Iliad-More-HTML5'>
	^self add: ILAudioElement new
    ]

    canvas [
	<category: '*Iliad-More-HTML5'>
	^self add: ILCanvasElement new
    ]

    command [
	<category: '*Iliad-More-HTML5'>
	^self add: ILCommandElement new
    ]

    datalist [
	<category: '*Iliad-More-HTML5'>
	^self add: ILDatalistElement new
    ]

    details [
	<category: '*Iliad-More-HTML5'>
	^self add: ILDetailsElement new
    ]

    event-source [
	<category: '*Iliad-More-HTML5'>
	^self add: ILEventSourceElement new
    ]

    menu [
	<category: '*Iliad-More-HTML5'>
	^self add: ILMenuElement new
    ]

    meter [
	<category: '*Iliad-More-HTML5'>
	^self add: ILMeterElement new
    ]

    progress [
	<category: '*Iliad-More-HTML5'>
	^self add: ILProgressElement new
    ]

    source [
	<category: '*Iliad-More-HTML5'>
	^self add: ILSourceElement new
    ]

    time [
	<category: '*Iliad-More-HTML5'>
	^self add: ILTimeElement new
    ]
]
