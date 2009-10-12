"Contributed by Eli Green"


UIWidget subclass: DataGrid [
    | items columnNames builders |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    body [
	<category: 'building'>
	^[:tbody | self visibleItemsDo: [:item | 
	    tbody tr build: (self rowForItem: item)]]
    ]

    contents [
	<category: 'building'>
	^[:e | 
	    (e div class: self cssClass) table build: [:table | 
		table thead build: self header.
		table tbody build: self body.
		table tfoot build: self footer]]
    ]

    footer [
	<category: 'building'>
	^[:tfoot | ]
    ]

    header [
	<category: 'building'>
	^[:thead | 
	    self columnNames do: [:each | 
		thead th html: each]]
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

    column: aColumn buildContents: aBlock [
	<category: 'accessing'>
	[self builders size < aColumn] 
	    whileTrue: [self builders addLast: [:e :item | ]].
	self builders at: aColumn put: aBlock.
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

