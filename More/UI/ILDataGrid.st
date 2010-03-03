"Contributed by Eli Green"


ILUIWidget subclass: ILDataGridHeader [
    | grid |

    <comment: nil>
    <category: 'Iliad-More-UI'>

    rootElementClass [
	^ILTableRowElement
    ]

    contents [
	<category: 'building'>
	^[:tr |
	    self grid columnNames do: [:each | 
		   tr th text: each]]
    ]

    grid [
    	<category: 'accessing'>
	^grid
    ]

    grid: anObject [
	<category: 'accessing'>
	grid := anObject.
    ]
]

ILUIWidget subclass: ILDataGridRow [
    | grid item |

    <comment: nil>
    <category: 'Iliad-More-UI'>

    rootElementClass [
	^ILTableRowElement
    ]

    contents [
	<category: 'building'>
	^[:tr |
	    self grid builders do: [:builder |
                (builder argumentCount = 3)
                    ifTrue: [builder value: tr td value: item value: self]
                    ifFalse: [builder value: tr td value: item]]]
    ]

    item [
    	<category: 'accessing'>
	^item
    ]

    item: anObject [
	<category: 'accessing'>
	item := anObject.
    ]

    grid [
    	<category: 'accessing'>
	^grid
    ]

    grid: anObject [
	<category: 'accessing'>
	grid := anObject.
    ]
]

ILUIWidget subclass: ILDataGridFooter [
    | grid |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    rootElementClass [
	^ILTableRowElement
    ]

    contents [
	<category: 'building'>
	^[:e |
	    "nothing here"
	]
    ]

    grid [
    	<category: 'accessing'>
	^grid
    ]

    grid: anObject [
	<category: 'accessing'>
	grid := anObject.
    ]
]

ILUIWidget subclass: ILDataGrid [
    | items columnNames builders headerClass footerClass rowClass |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    ILDataGrid class >> defaultHeaderClass [
	^ILDataGridHeader
    ]

    ILDataGrid class >> defaultFooterClass [
	^ILDataGridFooter
    ]

    ILDataGrid class >> defaultRowClass [
	^ILDataGridRow
    ]

    headerClass [
	headerClass isNil ifTrue:
	    [headerClass := self class defaultHeaderClass].
	^headerClass
    ]

    footerClass [
	footerClass isNil ifTrue:
	    [footerClass := self class defaultFooterClass].
	^footerClass
    ]

    rowClass [
	rowClass isNil ifTrue:
	    [rowClass := self class defaultRowClass].
	^rowClass
    ]

    contents [
	<category: 'building'>
	^[:e | 
	    e table build: [:table | 
		table thead build: (self headerClass new grid: self).
		table tbody build: self body.
		table tfoot build: (self footerClass new grid: self)]]
    ]

    body [
	<category: 'building'>
	^[:tbody |
	    self visibleItemsDo: [:item | 
		tbody build: (self rowForItem: item)]]
    ]

    rowForItem: anItem [
	<category: 'building'>
	^[:tbody |
	    tbody build: (self rowClass new grid: self; item: anItem)]
    ]

    visibleItemsDo: aBlock [
	<category: 'building'>
	self items do: aBlock
    ]

    builders [
	<category: 'accessing'>
	builders isNil ifTrue: [builders := OrderedCollection new].
	^builders
    ]

    column: anInteger buildContents: aBlock [
	<category: 'accessing'>
	[self builders size < anInteger] 
	    whileTrue: [self builders addLast: [:e :item | ]].
	self builders at: anInteger put: aBlock.
	self markDirty
    ]

    columnNames [
	<category: 'accessing'>
	^columnNames
    ]

    columnNames: anObject [
	<category: 'accessing'>
	columnNames := anObject.
	self markDirty
    ]

    cssClass [
	<category: 'accessing'>
	^super cssClass , ' datagrid'
    ]

    items [
	<category: 'accessing'>
	^items
    ]

    items: anObject [
	<category: 'accessing'>
	items := anObject.
	self markDirty
    ]
]

