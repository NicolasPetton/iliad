"Contributes by Eli Green"


ILDataGrid subclass: ILPagedDataGrid [
    | rowsPerPage currentPage |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    defaultRowsPerPage [
	<category: 'defaults'>
	^10
    ]

    currentPage [
	<category: 'accessing'>
	^(currentPage ifNil: [1]) min: self totalPages
    ]

    currentPage: anInteger [
	<category: 'accessing'>
	currentPage := anInteger.
	self markDirty
    ]

    rowsPerPage [
	<category: 'accessing'>
	^rowsPerPage ifNil: [self defaultRowsPerPage]
    ]

    rowsPerPage: anInteger [
	<category: 'accessing'>
	rowsPerPage = anInteger ifFalse: [self markDirty].
	rowsPerPage := anInteger
    ]

    totalPages [
	<category: 'accessing'>
	^(self items size / self rowsPerPage) ceiling max: 1
    ]

    visibleItemsDo: aBlock [
	<category: 'accessing'>
	| fromIndex toIndex |
	fromIndex := (self currentPage - 1) * self rowsPerPage + 1.
	toIndex := fromIndex + self rowsPerPage - 1 min: self items size.
	fromIndex to: toIndex
	    do: [:each | aBlock value: (self items at: each)]
    ]

    footer [
	<category: 'building'>
	^[:tfoot | 
	    tfoot td
		colspan: self columnNames size;
		build: ((ILPaginator new)
			totalPages: self totalPages;
			currentPage: self currentPage;
			action: [:val | self currentPage: val])]
    ]
]

