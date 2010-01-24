"Contributed by Eli Green"


ILUIWidget subclass: ILDataGrid [
    | items columnNames builders |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    contents [
	<category: 'building'>
	^[:e | 
	    (e div class: self cssClass) table build: [:table | 
		table thead build: self header.
		table tbody build: self body.
		table tfoot build: self footer]]
    ]

    header [
	<category: 'building'>
	^[:thead | 
	    self columnNames do: [:each | 
		thead th text: each]]
    ]

    body [
	<category: 'building'>
	^[:tbody | self visibleItemsDo: [:item | 
	    tbody tr build: (self rowForItem: item)]]
    ]

    footer [
	<category: 'building'>
	^[:tfoot | ]
    ]

    rowForItem: anItem [
	<category: 'building'>
	^[:tr | 
	    self builders do: [:each | 
		each value: tr td value: anItem]]
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

