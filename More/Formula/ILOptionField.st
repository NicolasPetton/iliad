ILField subclass: ILOptionField [
    | options optionLabelBlock |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    optionLabelBlock [
	<category: 'accessing'>
	^optionLabelBlock ifNil: [self defaultOptionLabelBlock]
    ]

    optionLabelBlock: aBlock [
	<category: 'accessing'>
	optionLabelBlock := aBlock
    ]

    defaultOptionLabelBlock [
	<category: 'defaults'>
	^[:option | option printString]
    ]

    options [
	<category: 'accessing'>
	^options ifNil: [{}]
    ]

    options: aCollection [
	<category: 'accessing'>
	options := aCollection
    ]

    options: aCollection labels: aBlock [
	<category: 'accessing'>
	self options: aCollection.
	self optionLabelBlock: aBlock
    ]
]
