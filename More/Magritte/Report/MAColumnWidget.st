"======================================================================
|
|   Magritte.MAColumnWidget class definition
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



Object subclass: MAColumnWidget [
    | report properties |
    
    <category: 'Iliad-More-Magritte-Report'>
    <comment: nil>

    MAColumnWidget class >> descriptionComment [
	<category: 'accessing-description'>
	^(MAStringDescription new)
	    accessor: #comment;
	    label: 'Comment';
	    priority: 200;
	    yourself
    ]

    MAColumnWidget class >> descriptionTitle [
	<category: 'accessing-description'>
	^(MAStringDescription new)
	    accessor: #title;
	    label: 'Title';
	    priority: 100;
	    yourself
    ]

    MAColumnWidget class >> new [
	<category: 'instance creation'>
	^self basicNew initialize
    ]

    buildCell: anObject index: anInteger [
	<category: 'building'>
	^[:e | 
	e td build: (self format 
	    valueWithArguments: ((Array with: anObject with: anInteger) 
	    first: self format selector numArgs))]
    ]

    buildCellContent: anObject [
	<category: 'building'>
	^[:e |
	    e text: (self valueFor: anObject)]
    ]

    buildFootCell [
	<category: 'building'>
	^[:e |
	    e td build: self buildFootContent]
    ]

    buildFootContent [
	<category: 'building'>
	^[:e |
	    self footer isNil ifFalse: [
		e build: self footer]]
    ]

    buildHeadCell [
	<category: 'building'>
	^[:e | 
	    | th |
	    th := e th
		class: self sorterStyle;
		title: (self comment ifNil: ['']);
		yourself.
	    self isSortable 
		ifFalse: [th build: self buildHeadContent]
		ifTrue: [th a
			action: [self report sort: self];
			build: self buildHeadContent]]
    ]

    buildHeadContent [
	<category: 'building'>
	^[:e |
	    e text: self title]
    ]

    cascade [
	<category: 'accessing-settings'>
	^self propertyAt: #cascade ifAbsent: [self defaultCascade]
    ]

    cascade: anArray [
	<category: 'accessing-settings'>
	self propertyAt: #cascade put: anArray
    ]

    comment [
	<category: 'accessing-settings'>
	^self propertyAt: #comment ifAbsent: [self defaultComment]
    ]

    comment: aString [
	<category: 'accessing-settings'>
	self propertyAt: #comment put: aString
    ]

    footer [
	<category: 'accessing-settings'>
	^self propertyAt: #footer ifAbsent: [self defaultFooter]
    ]

    footer: aBlock [
	<category: 'accessing-settings'>
	self propertyAt: #footer put: aBlock
    ]

    format [
	<category: 'accessing-settings'>
	^self propertyAt: #format ifAbsent: [self defaultFormat]
    ]

    format: aBlock [
	<category: 'accessing-settings'>
	self propertyAt: #format put: aBlock
    ]

    sorter [
	<category: 'accessing-settings'>
	^self propertyAt: #sorter ifAbsent: [self defaultSorter]
    ]

    sorter: aBlock [
	<category: 'accessing-settings'>
	self propertyAt: #sorter put: aBlock
    ]

    title [
	<category: 'accessing-settings'>
	^self propertyAt: #title ifAbsent: [self defaultTitle]
    ]

    title: aString [
	<category: 'accessing-settings'>
	self propertyAt: #title put: aString
    ]

    visible [
	<category: 'accessing-settings'>
	^self propertyAt: #visible ifAbsent: [self defaultVisible]
    ]

    visible: aBoolean [
	<category: 'accessing-settings'>
	self propertyAt: #visible put: aBoolean
    ]

    column [
	<category: 'accessing'>
	^self report cache collect: [:each | self valueFor: each]
    ]

    index [
	<category: 'accessing'>
	^self report columns indexOf: self
    ]

    report [
	<category: 'accessing'>
	^report
    ]

    sorterStyle [
	<category: 'accessing'>
	^self isSorted 
	    ifTrue: 
		[self isReversed 
		    ifTrue: [self report sorterStyles first]
		    ifFalse: [self report sorterStyles second]]
	    ifFalse: [String new]
    ]

    defaultCascade [
	<category: 'accessing-defaults'>
	^#(#yourself)
    ]

    defaultComment [
	<category: 'accessing-defaults'>
	^nil
    ]

    defaultFooter [
	<category: 'accessing-defaults'>
	^nil
    ]

    defaultFormat [
	<category: 'accessing-defaults'>
	^DirectedMessage receiver: self selector: #buildCellContent:
    ]

    defaultSorter [
	<category: 'accessing-defaults'>
	^[:a :b | | x y |
	    (x := self valueFor: a) isNil 
		or: [(y := self valueFor: b) notNil 
		    and: [x <= y]]]
    ]

    defaultTitle [
	<category: 'accessing-defaults'>
	^self cascade first asCapitalizedPhrase
    ]

    defaultVisible [
	<category: 'accessing-defaults'>
	^true
    ]

    exportContent: anObject index: aNumber on: aStream [
	<category: 'exporting'>
	aStream nextPutAll: (anObject asString 
		collect: [:each | each isSeparator ifTrue: [
			Character space] ifFalse: [each]])
    ]

    exportHeadOn: aStream [
	<category: 'exporting'>
	self title isNil ifFalse: [aStream nextPutAll: self title]
    ]

    initialize [
	<category: 'initialization'>
	properties := Dictionary new
    ]

    setReport: aReport [
	<category: 'initialization'>
	report := aReport
    ]

    isReversed [
	<category: 'testing'>
	^self report sortReversed
    ]

    isSortable [
	<category: 'testing'>
	^self report sortEnabled and: [self sorter notNil]
    ]

    isSorted [
	<category: 'testing'>
	^self report sortColumn = self
    ]

    isVisible [
	<category: 'testing'>
	^self visible
    ]

    properties [
	<category: 'accessing-properties'>
	^properties
    ]

    propertyAt: aSymbol [
	<category: 'accessing-properties'>
	^self properties at: aSymbol
    ]

    propertyAt: aSymbol ifAbsent: aBlock [
	<category: 'accessing-properties'>
	^self properties at: aSymbol ifAbsent: aBlock
    ]

    propertyAt: aSymbol ifAbsentPut: aBlock [
	<category: 'accessing-properties'>
	^self properties at: aSymbol ifAbsentPut: aBlock
    ]

    propertyAt: aSymbol put: anObject [
	<category: 'accessing-properties'>
	^self properties at: aSymbol put: anObject
    ]

    refresh [
	<category: 'actions'>
	self report markDirty
    ]

    selector: aSymbol [
	<category: 'actions'>
	self cascade: (Array with: aSymbol)
    ]

    sortRows: aCollection [
	<category: 'actions'>
	| result |
	result := SortedCollection new: aCollection size.
	result
	    sortBlock: self sorter;
	    addAll: aCollection.
	^self isReversed ifFalse: [result] ifTrue: [result reverse]
    ]

    valueFor: aRow [
	<category: 'actions'>
	^self cascade inject: aRow into: [:result :each | result perform: each]
    ]
]

