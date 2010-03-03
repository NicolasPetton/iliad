"Contributes by Eli Green"


ILDataGridFooter subclass: ILPagedDataGridFooter [
    <comment: nil>

    contents [
        <category: 'building'>
        ^[:tr |
            tr td 
                colspan: self grid columnNames size;
                build: (ILPaginator new
                  totalPages: self grid totalPages;
                  currentPage: self grid currentPage;
                  action: [:val | self grid currentPage: val])
        ]
    ]
]

ILDataGrid subclass: ILPagedDataGrid [
    | rowsPerPage currentPage |

    <comment: nil>
    <category: 'Iliad-More-UI'>

    ILPagedDataGrid class >> defaultFooterClass [
        ^ILPagedDataGridFooter
    ]

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
]

