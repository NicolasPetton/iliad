"======================================================================
|
|   Magritte.MAVerifiedPasswordWidget class definition
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



MATextPasswordWidget subclass: MAVerifiedPasswordWidget [
    | verificationValue |
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Widgets'>

    doValidate [
	<category: 'private'>
	self value = verificationValue 
	    ifFalse: 
		[^MAConditionError description: self description
		    signal: 'Your passwords do not match'].
	super doValidate
    ]

    editorContents [
	<category: 'buidling'>
	^[:e | 
	    e build: super editorContents.
	    e br.
	    e password
		class: 'verification';
		value: self verificationString;
		action: [:val | self verificationString: val]]
    ]

    setDescription: aDescription [
	<category: 'initialization'>
	super setDescription: aDescription.
	self verificationValue: self value
    ]

    verificationString [
	<category: 'accessing'>
	^self description obfuscated: self verificationValue
    ]

    verificationString: aString [
	<category: 'accessing'>
	| value |
	(self description isObfuscated: aString) ifTrue: [^self].
	value := [self description fromString: aString] ifError: [aString].
	self verificationValue: value
    ]

    verificationValue [
	<category: 'accessing'>
	^verificationValue
    ]

    verificationValue: anObject [
	<category: 'accessing'>
	verificationValue := anObject
    ]
]

