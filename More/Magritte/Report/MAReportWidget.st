"======================================================================
|
|   Magritte.MAReportWidget class definition
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



MAWidget subclass: MAReportWidget [
    | rows cache columns properties backtracked |
    
    <comment: nil>
    <category: 'Iliad-More-Magritte-Report'>

    MAReportWidget class >> description2000 [
	<category: 'accessing-description-table'>
	^(MABooleanDescription new)
	    accessor: #showHeader;
	    label: 'Show Header';
	    priority: 2000;
	    yourself
    ]

    MAReportWidget class >> description2100 [
	<category: 'accessing-description-table'>
	^(MABooleanDescription new)
	    accessor: #showBody;
	    label: 'Show Body';
	    priority: 2100;
	    yourself
    ]

    MAReportWidget class >> description2200 [
	<category: 'accessing-description-table'>
	^(MAStringDescription new)
	    accessor: #tableEmpty;
	    label: 'Empty';
	    priority: 2200;
	    yourself
    ]

    MAReportWidget class >> description2300 [
	<category: 'accessing-description-table'>
	^(MABooleanDescription new)
	    accessor: #showFooter;
	    label: 'Show Footer';
	    priority: 2300;
	    yourself
    ]

    MAReportWidget class >> description2400 [
	<category: 'accessing-description-table'>
	^(MABooleanDescription new)
	    accessor: #showCaption;
	    label: 'Show Caption';
	    priority: 2300;
	    yourself
    ]

    MAReportWidget class >> description2500 [
	<category: 'accessing-description-table'>
	^(MAStringDescription new)
	    accessor: #tableCaption;
	    label: 'Caption';
	    priority: 2500;
	    yourself
    ]

    MAReportWidget class >> description2600 [
	<category: 'accessing-description-table'>
	^(MABooleanDescription new)
	    accessor: #showSummary;
	    label: 'Show Summary';
	    priority: 2600;
	    yourself
    ]

    MAReportWidget class >> description2700 [
	<category: 'accessing-description-table'>
	^(MAStringDescription new)
	    accessor: #tableSummary;
	    label: 'Summary';
	    priority: 2700;
	    yourself
    ]

    MAReportWidget class >> description4000 [
	<category: 'accessing-description-batch'>
	^(MABooleanDescription new)
	    accessor: #showBatch;
	    label: 'Show Batch';
	    priority: 4000;
	    yourself
    ]

    MAReportWidget class >> description4100 [
	<category: 'accessing-description-batch'>
	^(MANumberDescription new)
	    accessor: #batchSize;
	    label: 'Size';
	    priority: 4100;
	    yourself
    ]

    MAReportWidget class >> description4200 [
	<category: 'accessing-description-batch'>
	^(MABooleanDescription new)
	    accessor: #showBatchFirstLast;
	    label: 'Show First/Last';
	    priority: 4200;
	    yourself
    ]

    MAReportWidget class >> description4300 [
	<category: 'accessing-description-batch'>
	^(MABooleanDescription new)
	    accessor: #showBatchPreviousNext;
	    label: 'Show Previous/Next';
	    priority: 4300;
	    yourself
    ]

    MAReportWidget class >> description4400 [
	<category: 'accessing-description-batch'>
	^(MABooleanDescription new)
	    accessor: #showBatchPages;
	    label: 'Show Pages';
	    priority: 4400;
	    yourself
    ]

    MAReportWidget class >> isAbstract [
	<category: 'testing'>
	^false
    ]

    MAReportWidget class >> rows: aCollection [
	<category: 'instance creation'>
	^(self new)
	    rows: aCollection;
	    yourself
    ]

    MAReportWidget class >> rows: aCollection description: aDescription [
	<category: 'instance creation'>
	| report |
	report := self rows: aCollection.
	aDescription asContainer do: [:each | report addColumnDescription: each].
	^report
    ]

    addColumn: aColumn [
	<category: 'columns'>
	columns := columns copyWith: aColumn.
	^aColumn
	    setReport: self;
	    yourself
    ]

    addColumnCascade: anArray [
	<category: 'columns'>
	^(self addColumn: MAColumnWidget new)
	    cascade: anArray;
	    yourself
    ]

    addColumnDescription: aDescription [
	<category: 'columns'>
	^self addColumn: ((aDescription reportColumnWidgetClass new)
		    setDescription: aDescription;
		    yourself)
    ]

    addColumnSelector: aSelector [
	<category: 'columns'>
	^(self addColumn: MAColumnWidget new)
	    selector: aSelector;
	    yourself
    ]

    moveDown: aColumn [
	<category: 'columns'>
	| index |
	index := self columns indexOf: aColumn ifAbsent: [^self].
	self columns swap: index
	    with: (index = self size ifFalse: [index + 1] ifTrue: [1])
    ]

    moveUp: aColumn [
	<category: 'columns'>
	| index |
	index := self columns indexOf: aColumn ifAbsent: [^self].
	self columns swap: index
	    with: (index = 1 ifFalse: [index - 1] ifTrue: [self size])
    ]

    remove: aColumn [
	<category: 'columns'>
	columns := columns copyWithout: aColumn
    ]

    batchEndIndex [
	<category: 'private-batch'>
	^self batchPage * self batchSize min: self cache size
    ]

    batchMaxPages [
	<category: 'private-batch'>
	^(self cache size / self batchSize) ceiling
    ]

    batchPageRange [
	<category: 'private-batch'>
	^self batchPageRangeStart to: self batchPageRangeEnd
    ]

    batchPageRangeEnd [
	<category: 'private-batch'>
	^self batchMaxPages min: self batchPage + 9
    ]

    batchPageRangeStart [
	<category: 'private-batch'>
	^self defaultBatchPage max: self batchPage - 9
    ]

    batchStartIndex [
	<category: 'private-batch'>
	^(self batchPage - 1) * self batchSize + 1
    ]

    isOnFirstPage [
	<category: 'private-batch'>
	^self batchPage = 1
    ]

    isOnLastPage [
	<category: 'private-batch'>
	^self batchPage = self batchMaxPages
    ]

    batchFirstContents [
	<category: 'building-batch'>
	^
	[:e | 
	self isOnFirstPage 
	    ifFalse: 
		[e a
		    action: [self batchPage: self defaultBatchPage];
		    text: '|<']
	    ifTrue: [e text: '|<'].
	e space]
    ]

    batchItemsContents [
	<category: 'building-batch'>
	^[:e | 
	    self batchPageRangeStart > self defaultBatchPage ifTrue: [
		e text: '...'; space].
	    self batchPageRange do: [:index | 
		self batchPage = index 
		    ifFalse: [e a action: [self batchPage: index];
			text: index printString]
		    ifTrue: [e span class: 'current';
			text: index printString].
		e space].
	    self batchPageRangeEnd < (self batchMaxPages - 1) ifTrue: [
		e text: '...'; space].
	    self batchPageRangeEnd = self batchMaxPages ifFalse: [
		e a
		    action: [self batchPage: self batchMaxPages];
		    text: self batchMaxPages printString]]
    ]

    batchLastContents [
	<category: 'building-batch'>
	^
	[:e | 
	self isOnLastPage 
	    ifFalse: [e a action: [self batchPage: self batchMaxPages];
		    text: '>|']
	    ifTrue: [e text: '>|']]
    ]

    batchNextContents [
	<category: 'building-batch'>
	^[:e | 
	    self isOnLastPage 
	    ifFalse: [e a action: [self nextPage]; text: '>>']
	    ifTrue: [e text: '>>'].
	e space]
    ]

    batchPreviousContents [
	<category: 'building-batch'>
	^[:e | 
	    self isOnFirstPage 
		ifFalse: [e a action: [self previousPage]; text: '<<']
		ifTrue: [e text: '<<'].
	e space]
    ]

    batchPage [
	<category: 'accessing-settings'>
	^backtracked at: #batchPage ifAbsentPut: [self defaultBatchPage]
    ]

    batchPage: anInteger [
	<category: 'accessing-settings'>
	backtracked at: #batchPage put: anInteger.
	self markDirty
    ]

    batchSize [
	<category: 'accessing-settings'>
	^properties at: #batchSize ifAbsent: [self defaultBatchSize]
    ]

    batchSize: anInteger [
	<category: 'accessing-settings'>
	properties at: #batchSize put: anInteger
    ]

    rowFilter [
	<category: 'accessing-settings'>
	^backtracked at: #rowFilter ifAbsent: [self defaultRowFilter]
    ]

    rowFilter: aBlock [
	<category: 'accessing-settings'>
	backtracked at: #rowFilter put: aBlock.
	self refresh
    ]

    rowPeriod [
	<category: 'accessing-settings'>
	^properties at: #rowPeriod ifAbsent: [self defaultRowPeriod]
    ]

    rowPeriod: aNumber [
	<category: 'accessing-settings'>
	properties at: #rowPeriod put: aNumber
    ]

    rowStyles [
	<category: 'accessing-settings'>
	^properties at: #rowStyles ifAbsent: [self defaultRowStyles]
    ]

    rowStyles: aCollection [
	<category: 'accessing-settings'>
	properties at: #rowStyles put: aCollection
    ]

    showBatch [
	<category: 'accessing-settings'>
	^properties at: #showBatch ifAbsent: [self defaultShowBatch]
    ]

    showBatch: aBoolean [
	<category: 'accessing-settings'>
	properties at: #showBatch put: aBoolean
    ]

    showBatchFirstLast [
	<category: 'accessing-settings'>
	^properties at: #showBatchFirstLast
	    ifAbsent: [self defaultShowBatchFirstLast]
    ]

    showBatchFirstLast: aBoolean [
	<category: 'accessing-settings'>
	properties at: #showBatchFirstLast put: aBoolean
    ]

    showBatchPages [
	<category: 'accessing-settings'>
	^properties at: #showBatchPages ifAbsent: [self defaultShowBatchPages]
    ]

    showBatchPages: aBoolean [
	<category: 'accessing-settings'>
	properties at: #showBatchPages put: aBoolean
    ]

    showBatchPreviousNext [
	<category: 'accessing-settings'>
	^properties at: #showBatchPreviousNext
	    ifAbsent: [self defaultShowBatchPreviousNext]
    ]

    showBatchPreviousNext: aBoolean [
	<category: 'accessing-settings'>
	properties at: #showBatchPreviousNext put: aBoolean
    ]

    showBody [
	<category: 'accessing-settings'>
	^properties at: #showBody ifAbsent: [self defaultShowBody]
    ]

    showBody: aBoolean [
	<category: 'accessing-settings'>
	properties at: #showBody put: aBoolean
    ]

    showCaption [
	<category: 'accessing-settings'>
	^properties at: #showCaption ifAbsent: [self defaultShowCaption]
    ]

    showCaption: aBoolean [
	<category: 'accessing-settings'>
	properties at: #showCaption put: aBoolean
    ]

    showFooter [
	<category: 'accessing-settings'>
	^properties at: #showFooter ifAbsent: [self defaultShowFooter]
    ]

    showFooter: aBoolean [
	<category: 'accessing-settings'>
	properties at: #showFooter put: aBoolean
    ]

    showHeader [
	<category: 'accessing-settings'>
	^properties at: #showHeader ifAbsent: [self defaultShowHeader]
    ]

    showHeader: aBoolean [
	<category: 'accessing-settings'>
	properties at: #showHeader put: aBoolean
    ]

    showSummary [
	<category: 'accessing-settings'>
	^properties at: #showSummary ifAbsent: [self defaultShowSummary]
    ]

    showSummary: aBoolean [
	<category: 'accessing-settings'>
	properties at: #showSummary put: aBoolean
    ]

    sortColumn [
	<category: 'accessing-settings'>
	^backtracked at: #sortColumn ifAbsent: [self defaultSortColumn]
    ]

    sortColumn: aColumn [
	<category: 'accessing-settings'>
	backtracked at: #sortColumn put: aColumn
    ]

    sortEnabled [
	<category: 'accessing-settings'>
	^properties at: #sortEnabled ifAbsent: [self defaultSortEnabled]
    ]

    sortEnabled: aBoolean [
	<category: 'accessing-settings'>
	properties at: #sortEnabled put: aBoolean
    ]

    sortReversed [
	<category: 'accessing-settings'>
	^backtracked at: #sortReversed ifAbsent: [self defaultSortReversed]
    ]

    sortReversed: aBoolean [
	<category: 'accessing-settings'>
	backtracked at: #sortReversed put: aBoolean
    ]

    sorterStyles [
	<category: 'accessing-settings'>
	^properties at: #sorterStyles ifAbsent: [self defaultSorterStyles]
    ]

    sorterStyles: aCollection [
	<category: 'accessing-settings'>
	properties at: #sorterStyles put: aCollection
    ]

    tableCaption [
	<category: 'accessing-settings'>
	^properties at: #tableCaption ifAbsent: [self defaultTableCaption]
    ]

    tableCaption: aString [
	<category: 'accessing-settings'>
	properties at: #tableCaption put: aString
    ]

    tableEmpty [
	<category: 'accessing-settings'>
	^properties at: #tableEmpty ifAbsent: [self defaultTableEmpty]
    ]

    tableEmpty: aString [
	<category: 'accessing-settings'>
	properties at: #tableEmpty put: aString
    ]

    tableSummary [
	<category: 'accessing-settings'>
	^properties at: #tableSummary ifAbsent: [self defaultTableSummary]
    ]

    tableSummary: aString [
	<category: 'accessing-settings'>
	properties at: #tableSummary put: aString
    ]

    cache [
	"Return the cached rows of the receiver, these rows are filtered and sorted."

	<category: 'accessing-readonly'>
	cache isNil 
	    ifTrue: [self cache: (self sortRows: (self filterRows: self rows asArray))].
	^cache
    ]

    cache: aCollection [
	<category: 'accessing-readonly'>
	cache := aCollection
    ]

    columns [
	<category: 'accessing-readonly'>
	^columns
    ]

    columns: aCollection [
	<category: 'accessing-readonly'>
	columns := aCollection
    ]

    states [
	<category: 'accessing-readonly'>
	^Array with: backtracked
    ]

    visible [
	<category: 'accessing-readonly'>
	^self showBatch 
	    ifFalse: [self cache]
	    ifTrue: [self cache copyFrom: self batchStartIndex to: self batchEndIndex]
    ]

    visibleColumns [
	<category: 'accessing-readonly'>
	^self columns select: [:each | each isVisible]
    ]

    contents [
	<category: 'building'>
	^
	[:e | 
	(e table)
	    class: 'report';
	    build: self tableContents]
    ]

    tableContents [
	<category: 'building'>
	^[:e || thead tfoot tbody |
	    self showCaption ifTrue: [
		e build: self tableCaptionContents].
	    self showSummary ifTrue: [
		e build: self tableSummaryContents].
	    thead := e thead.
	    self showHeader ifTrue: [
		thead build: self tableHeadContents].
	    ((self showBatch
		and: [self hasMoreThanOnePage])
		or: [self showFooter]) ifTrue: 
		["we must not produce an empty tfoot element, this is not valid xhtml"
		tfoot := e tfoot.
		self showFooter ifTrue: [
		    tfoot build: self tableFootContents].
		self showBatch ifTrue: [
		    tfoot build: self tableBatchContents]].
	tbody := e tbody.
	self showBody ifTrue: [
	    tbody build: self tableBodyContents]]
    ]

    defaultBatchPage [
	<category: 'accessing-defaults'>
	^1
    ]

    defaultBatchSize [
	<category: 'accessing-defaults'>
	^10
    ]

    defaultRowFilter [
	<category: 'accessing-defaults'>
	^nil
    ]

    defaultRowPeriod [
	<category: 'accessing-defaults'>
	^1
    ]

    defaultRowStyles [
	<category: 'accessing-defaults'>
	^Array with: 'odd' with: 'even'
    ]

    defaultShowBatch [
	<category: 'accessing-defaults'>
	^true
    ]

    defaultShowBatchFirstLast [
	<category: 'accessing-defaults'>
	^false
    ]

    defaultShowBatchPages [
	<category: 'accessing-defaults'>
	^true
    ]

    defaultShowBatchPreviousNext [
	<category: 'accessing-defaults'>
	^true
    ]

    defaultShowBody [
	<category: 'accessing-defaults'>
	^true
    ]

    defaultShowCaption [
	<category: 'accessing-defaults'>
	^false
    ]

    defaultShowFooter [
	<category: 'accessing-defaults'>
	^false
    ]

    defaultShowHeader [
	<category: 'accessing-defaults'>
	^true
    ]

    defaultShowSummary [
	<category: 'accessing-defaults'>
	^false
    ]

    defaultSortColumn [
	<category: 'accessing-defaults'>
	^nil
    ]

    defaultSortEnabled [
	<category: 'accessing-defaults'>
	^true
    ]

    defaultSortReversed [
	<category: 'accessing-defaults'>
	^false
    ]

    defaultSorterStyles [
	<category: 'accessing-defaults'>
	^Array with: 'ascending' with: 'descending'
    ]

    defaultTableCaption [
	<category: 'accessing-defaults'>
	^nil
    ]

    defaultTableEmpty [
	<category: 'accessing-defaults'>
	^'The report is empty.'
    ]

    defaultTableSummary [
	<category: 'accessing-defaults'>
	^nil
    ]

    export [
	<category: 'exporting'>
	^String streamContents: [:stream | self exportOn: stream]
    ]

    exportBodyOn: aStream [
	<category: 'exporting'>
	self cache withIndexDo: [:row :index | 
	    self visibleColumns do: [:column | 
		column 
		    exportContent: (column valueFor: row)
		    index: index
		    on: aStream]
		separatedBy: [aStream tab].
	    aStream cr]
    ]

    exportHeaderOn: aStream [
	<category: 'exporting'>
	self visibleColumns do: [:each | each exportHeadOn: aStream]
	    separatedBy: [aStream tab].
	aStream cr
    ]

    exportOn: aStream [
	<category: 'exporting'>
	self showHeader ifTrue: [self exportHeaderOn: aStream].
	self showBody ifTrue: [self exportBodyOn: aStream]
    ]

    filterRows: aCollection [
	<category: 'private'>
	^self hasRowFilter 
	    ifFalse: [aCollection]
	    ifTrue: [aCollection select: self rowFilter]
    ]

    rowStyleForNumber: aNumber [
	<category: 'private'>
	^self rowStyles 
	    at: (aNumber - 1) // self rowPeriod \\ self rowStyles size + 1
	    ifAbsent: [String new]
    ]

    sortRows: aCollection [
	<category: 'private'>
	^self isSorted 
	    ifFalse: [aCollection]
	    ifTrue: [self sortColumn sortRows: aCollection]
    ]

    hasMoreThanOnePage [
	<category: 'testing'>
	^self batchSize < self cache size
    ]

    hasRowFilter [
	<category: 'testing'>
	^self rowFilter notNil
    ]

    isSorted [
	<category: 'testing'>
	^self sortColumn notNil
    ]

    initialize [
	<category: 'initialization'>
	super initialize.
	rows := columns := Array new.
	properties := Dictionary new.
	backtracked := Dictionary new
    ]

    nextPage [
	<category: 'actions'>
	self isOnLastPage 
	    ifFalse: 
		[self batchPage: self batchPage + 1.
		self markDirty]
    ]

    previousPage [
	<category: 'actions'>
	self isOnFirstPage 
	    ifFalse: 
		[self batchPage: self batchPage - 1.
		self markDirty]
    ]

    refresh [
	<category: 'actions'>
	self
	    cache: nil;
	    batchPage: self defaultBatchPage.
	self columns do: [:each | each refresh].
	self markDirty
    ]

    sort: aColumn [
	<category: 'actions'>
	aColumn = self sortColumn 
	    ifTrue: 
		[self sortReversed 
		    ifFalse: [self sortReversed: true]
		    ifTrue: 
			[self
			    sortColumn: nil;
			    sortReversed: false]]
	    ifFalse: 
		[self
		    sortColumn: aColumn;
		    sortReversed: false].
	self refresh
    ]

    rows [
	"Return the rows of the receiver."

	<category: 'accessing'>
	^rows
    ]

    rows: aCollection [
	"Set the rows of the receiver."

	<category: 'accessing'>
	rows := aCollection.
	self refresh
    ]

    tableBatchContents [
	<category: 'building-table'>
	^[:e | 
	    self hasMoreThanOnePage ifTrue: [| td |
		td := e tr td
		    class: 'batch';
		    colspan: self visibleColumns size;
			yourself.
		self showBatchFirstLast
		    ifTrue: [td build: self batchFirstContents].
		self showBatchPreviousNext
		    ifTrue: [td build: self batchPreviousContents].
		self showBatchPages
		    ifTrue: [td build: self batchItemsContents].
		self showBatchPreviousNext
		    ifTrue: [td build: self batchNextContents].
		self showBatchFirstLast
		    ifTrue: [td build: self batchLastContents]]]
    ]

    tableBodyContents [
	<category: 'building-table'>
	^[:e | 
	    self visible isEmpty 
		ifTrue: [| tr |
		    tr := e tr
			class: 'empty';
			yourself.
		tr td
		    colspan: self visibleColumns size;
		    text: self tableEmpty]
		ifFalse: [| tr |
		    self visible keysAndValuesDo: [:index :row | 
			tr := e tr
			    class: (self rowStyleForNumber: index);
			    yourself.
			self visibleColumns do: [:col |
			    tr build: (col
				buildCell: row
				index: index)]]]]
    ]

    tableCaptionContents [
	<category: 'building-table'>
	^[:e | (e text tag: 'caption') add: self tableCaption]
    ]

    tableFootContents [
	<category: 'building-table'>
	^[:e | | tr |
	tr := e tr.
	self visibleColumns do: [:each |
	    tr build: each buildFootCell]]
    ]

    tableHeadContents [
	<category: 'building-table'>
	^[:e | | tr |
	tr := e tr.
	self visibleColumns do: [:each |
	    tr build: each buildHeadCell]]
    ]

    tableSummaryContents [
	<category: 'building-table'>
	^[:e | (e text tag: 'summary') text: self tableSummary]
    ]
]

