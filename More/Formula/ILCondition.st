Object subclass: ILCondition [
    | labelBlock conditionBlock |

    <category: 'Iliad-More-Formula'>
    <comment: nil>

    conditionBlock [
	<category: 'accessing'>
	^conditionBlock
    ]

    conditionBlock: aBlock [
	<category: 'accessing'>
	conditionBlock := aBlock
    ]

    labelBlock [
	<category: 'accessing'>
	^labelBlock
    ]

    labelBlock: aBlock [
	<category: 'accessing'>
	labelBlock := aBlock
    ]

    validate: anObject [
	<category: 'validating'>
	^self conditionBlock value: anObject
    ]

    labelFor: anObject [
	<category: 'validating'>
	^self labelBlock value: anObject
    ]
]
