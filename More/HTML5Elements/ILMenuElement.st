"======================================================================
|
|   Iliad.ILMenuElement class definition
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



ILHTMLBuilderElement subclass: ILMenuElement [

    <category: 'Iliad-More-HTML5Elements'>
    <comment: 'The menu element represents a list of commands'>

    tag [
	<category: 'accessing'>
	^'menu'
    ]

    type: aString [
	"The kind of menu being declared.
	    - toolbar: indicates that the element represents a tool bar.
	    - context: indicates that the element represents a context menu.
	    - If the attribute is omitted, the element represents a list of 
	    commands that is neither a context menu or a toolbar"
    	<category: 'accessing-attributes'>
	self attributeAt: 'type' put: aString	
    ]
    
    label: aString [
	"The label of the menu"
	<category: 'accessing-attributes'>
	self attributeAt: 'label' put: aString
    ]

    beToolbar [
	<category: 'accessing-attributes'>
	self type: 'toolbar'
    ]

    beContext [
	<category: 'accessing-attributes'>
	self type: 'context'
    ]
]
