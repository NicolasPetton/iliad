"======================================================================
|
|   Iliad.ILCommandElement class definition
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



ILHTMLBuilderElement subclass: ILCommandElement [

    <category: 'Iliad-More-HTML5Elements'>
    <comment: 'A command element with no type attribute specified represents 
    the same thing as a command element with its type attribute set to command'>

    tag [
	<category: 'accessing'>
	^'command'
    ]

    beCheckbox [
	<category: 'accessing'>
	self type: 'checkbox'
    ]
    
    beChecked [
	<category: 'accessing'>
	self checked: true
    ]

    beCommand [
	"Specifies that its command element is a command with an associated action"
	
	<category: 'accessing'>
	self type: 'command'
    ]

    beDisabled [
	<category: 'accessing'>
	self disabled: true
    ]

    beHidden [
	<category: 'accessing'>
	self hidden: true
    ]
    
    beRadio [
	"Specifies that its command element represents a selection of one item from a list of items"
	
	<category: 'accessing'>
	self type: 'radio'
    ]

    checked: aBoolean [
	"Specifies that the command is selected"

	<category: 'accessing-attributes'>
	aBoolean ifTrue: [
	    self attributeAt: 'checked' put: 'checked']
    ]

    disabled: aBoolean [
	"Specifies that the command is not currently available"
	
	<category: 'accessing-attributes'>
	aBoolean ifTrue: [
	    self attributeAt: 'disabled' put: 'disabled']
    ]

    hidden: aBoolean [
	<category: 'accessing-attributes'>
	aBoolean ifTrue: [
	    self attributeAt: 'hidden' put: aBoolean]
    ]

    icon: aString [
	"An url for an image that represents the command"
	
	<category: 'accessing-attributes'>
	self attributeAt: 'icon' put: aString
    ]

    label: aString [
	"The name of the command, as shown to the user"
	
	<category: 'accessing-attributes'>
	self attributeAt: 'label' put: aString
    ]

    type: aString [
	"Specifies that the command is not currently available"
	
	<category: 'accessing-attributes'>
	self attributeAt: 'type' put: aString
    ]
]
