"======================================================================
|
|   Magritte.MAContainerDecorator class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from Magritte-Seaside written by Lukas Renggli 
| http://source.lukas-renggli.ch/magritte.
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



MAWidgetDecorator subclass: MAContainerDecorator [
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Decorators'>

    buttons [
	"Answer a collection of associations. The key is either a symbol that will be performed on the decorated widget or a one-argument block that will be executed with the widget as argument. The value is the button label."

	<category: 'accessing'>
	self subclassResponsibility
    ]

    default [
	<category: 'accessing'>
	^self buttons first key
    ]

    execute: anObject [
	<category: 'actions'>
	anObject isSymbol 
	    ifFalse: [anObject value: self widget]
	    ifTrue: [self widget perform: anObject]
    ]

    buttonsContents [
	<category: 'building'>
	^
	[:e | 
	| div |
	div := e div
	    class: 'buttons';
	    yourself.
	self buttons do: [:each | 
	    div button
		accessKey: each value first;
		action: [self execute: each key];
		text: each value]]
    ]

    contents [
	<category: 'building'>
	^[:e | 
	    e form
		class: 'magritte';
		multipart: self isMultipart;
		build: self decoratee contents;
		build: self buttonsContents]
    ]
]

