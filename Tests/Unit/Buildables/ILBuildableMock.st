ILBuildable subclass: ILBuildableMock [
    | rootElement |

    <category: 'Iliad-Tests-Unit-Buidables'>
    <comment: nil>

    build [
	<category: 'building'>
	^self rootElement
    ]

    rootElement [
	<category: 'accessing'>
	^rootElement ifNil: [rootElement := ILElement new]
    ]
]
