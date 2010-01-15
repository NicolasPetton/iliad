ILField subclass: ILAutocompleteInputField [
    | options fieldId |

    <comment: nil>
    <category: 'Iliad-More-Formula'>

    initialize [
	<category: 'initialize-release'>
	super initialize.
	fieldId := ILId new
    ]

    options [
	<category: 'accessing'>
	^options ifNil: [#()]
    ]

    options: aCollection [
	<category: 'accessing'>
	options := aCollection
    ]

    completerScript [
	<category: 'building'>
	| str |
	str := WriteStream on: ''.
	str nextPutAll: '
	jQuery(''#', fieldId , ''').autocomplete('.
	str nextPut: $[.
	self options do: [:each | 
	    str nextPutAll: '"' , each ,'"']
	separatedBy: [str nextPut: $,].
	str nextPutAll: '])'.
	^str contents
    ]

    fieldContents [
	<category: 'building'>
	^[:e | 
	e input
	    id: fieldId;
	    value: (self value ifNil: ['']);
	    action: [:val | self value: val].
	e script: self completerScript]
    ]
]
