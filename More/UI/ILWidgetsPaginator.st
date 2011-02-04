ILWidget subclass: ILWidgetsPaginator [
    | widgets currentPage widgetsPerPage beforeContentsBlock afterContentsBlock |

    <category: 'Iliad-More-UI'>
    <comment: nil>

    paginator [
	<category: 'accessing'>
	^ILPaginator new
	    totalPages: self totalPages;
	    currentPage: self currentPage;
	    action: [:val | self currentPage: val]
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
   
    widgets [
	<category: 'accessing'>
	^widgets ifNil: [widgets := OrderedCollection new]
    ]

    widgets: aCollection [
	<category: 'accessing'>
	widgets := aCollection
    ]

    widgetsPerPage [
	<category: 'accessing'>
	^widgetsPerPage ifNil: [self defaultWidgetsPerPage]
    ]

    widgetsPerPage: anInteger [
	<category: 'accessing'>
	widgetsPerPage := anInteger
    ]

    totalPages [
	<category: 'accessing'>
	^(self widgets size / self widgetsPerPage) ceiling max: 1
    ]

    visibleWidgets [
	<category: 'accessing'>
	| fromIndex toIndex |
	fromIndex := (self currentPage - 1) * self widgetsPerPage + 1.
	toIndex := fromIndex + self widgetsPerPage - 1 min: self widgets size.
	^(fromIndex to: toIndex) collect: [:each | self widgets at: each]
    ]

    beforeContentsBlock [
	<category: 'accessing'>
	^beforeContentsBlock
    ]

    beforeContentsBlock: aBlock [
	<category: 'accessing'>
	beforeContentsBlock := aBlock
    ]

    afterContentsBlock [
	<category: 'accessing'>
	^afterContentsBlock
    ]

    afterContentsBlock: aBlock [
	<category: 'accessing'>
	afterContentsBlock := aBlock
    ]

    defaultWidgetsPerPage [
	<category: 'defaults'>
	^5
    ]

    contents [
	<category: 'building'>
	^[:e |
	    self beforeContentsBlock ifNotNil: [
		e build: self beforeContentsBlock].
	    self visibleWidgets do: [:each |
		e build: each].
	    self afterContentsBlock ifNotNil: [
		e build: self afterContentsBlock].
	    e build: self paginator]
    ]
]
