"======================================================================
|
|    HTML5 extensions
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
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILVideoElement new
    ]

    audio [
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILAudioElement new
    ]

    canvas [
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILCanvasElement new
    ]

    command [
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILCommandElement new
    ]

    details [
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILDetailsElement new
    ]

    menu [
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILMenuElement new
    ]

    meter [
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILMeterElement new
    ]

    progress [
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILProgressElement new
    ]

    source [
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILSourceElement new
    ]

    searchInput [
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILSearchInputElement new
    ]

    time [
	<category: '*Iliad-More-HTML5Elements'>
	^self add: ILTimeElement new
    ]

    date [
	<category: '*Iliad-More-HTML5Elements'>
	^self input
	    beDate;
	    yourself
    ]

    datetime [
	<category: '*Iliad-More-HTML5Elements'>
	^self input
	    beDatetime;
	    yourself
    ]

    datetimeLocal [
	<category: '*Iliad-More-HTML5Elements'>
	^self input
	    beDatetimeLocal;
	    yourself
    ]

    timeInput [
	<category: '*Iliad-More-HTML5Elements'>
	^self input
	    beTime;
	    yourself
    ]

    range [
	<category: '*Iliad-More-HTML5Elements'>
	^self input
	    beRange;
	    yourself
    ]

    number [
	<category: '*Iliad-More-HTML5Elements'>
	^self input
	    beNumber;
	    yourself
    ]

    color [
	<category: '*Iliad-More-HTML5Elements'>
	^self input
	    beColor;
	    yourself
    ]

    email [
	<category: '*Iliad-More-HTML5Elements'>
	^self input
	    beEmail;
	    yourself
    ]

]



ILInputElement extend [

    step: anInteger [
	<category: '*Iliad-More-HTML5Elements'>
	self attributeAt: 'step' put: anInteger greaseString
    ]

    min: anInteger [
	<category: '*Iliad-More-HTML5Elements'>
	self attributeAt: 'min' put: anInteger greaseString
    ]

    max: anInteger [
	<category: '*Iliad-More-HTML5Elements'>
	self attributeAt: 'max' put: anInteger greaseString
    ]

    beDate [
	<category: '*ILiad-More-HTML5Elements'>
	self type: 'date'
    ]

    beDatetime [
	<category: '*ILiad-More-HTML5Elements'>
	self type: 'datetime'
    ]

    beDatetimeLocal [
	<category: '*ILiad-More-HTML5Elements'>
	self type: 'datetime-local'
    ]

    beTime [
	<category: '*ILiad-More-HTML5Elements'>
	self type: 'time'
    ]

    beRange [
	<category: '*ILiad-More-HTML5Elements'>
	self type: 'range'
    ]
    
    beNumber [
	<category: '*ILiad-More-HTML5Elements'>
	self type: 'number'
    ]
 
    beColor [
	<category: '*ILiad-More-HTML5Elements'>
	self type: 'color'
    ]
 
    beEmail [
	<category: '*ILiad-More-HTML5Elements'>
	self type: 'email'
    ]
]
