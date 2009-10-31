"Contributes by Eli Green"


DataGrid subclass: PagedDataGrid [
    | rowsPerPage currentPage |
    
    <comment: nil>
    <category: 'Iliad-More-UI'>

    currentPage [
	<category: 'accessing'>
	^currentPage ifNil: [1]
    ]

    currentPage: anObject [
	<category: 'accessing'>
	currentPage := anObject.
	self markDirty
    ]

    rowsPerPage [
	<category: 'accessing'>
	^rowsPerPage
    ]

    rowsPerPage: anObject [
	<category: 'accessing'>
	rowsPerPage = anObject ifFalse: [self markDirty].
	rowsPerPage := anObject
    ]

    visibleItemsDo: aBlock [
	<category: 'accessing'>
	| fromIndex toIndex |
	fromIndex := (self currentPage - 1) * self rowsPerPage + 1.
	toIndex := fromIndex + self rowsPerPage - 1 min: self items size.
	fromIndex to: toIndex
	    do: [:eachIndex | aBlock value: (self items at: eachIndex)]
    ]

    footer [
	<category: 'building'>
	^[:tfoot | 
	    tfoot td
		colspan: self columnNames size;
		build: ((Paginator new)
			totalPages: (self items size / self rowsPerPage) ceiling;
			currentPage: self currentPage;
			action: [:newPage | self currentPage: newPage])]
    ]
]

