"======================================================================
|
|   Magritte.MAActionColumnWidget class definition
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




MAColumnWidget subclass: MAActionColumnWidget [
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Report'>

    buildCellContent: anObject [
	<category: 'building'>
	^
	[:e | 
	self useLinks 
	    ifTrue: [e build: (self buildCellLinkContent: anObject)]
	    ifFalse: [e build: (self buildCellFormContent: anObject)]]
    ]

    buildCellFormContent: anObject [
	<category: 'building'>
	self subclassResponsibility
    ]

    buildCellLinkContent: anObject [
	<category: 'building'>
	self subclassResponsibility
    ]

    defaultTitle [
	<category: 'accessing-defaults'>
	^String new
    ]

    defaultUseLinks [
	<category: 'accessing-defaults'>
	^true
    ]

    useLinks [
	<category: 'accessing'>
	^self propertyAt: #useLinks ifAbsent: [self defaultUseLinks]
    ]

    useLinks: aBoolean [
	<category: 'accessing'>
	self propertyAt: #useLinks put: aBoolean
    ]
]

