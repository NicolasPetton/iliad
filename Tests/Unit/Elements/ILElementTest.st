TestCase subclass: ILElementTest [
    | e |

    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILElement new
    ]

    shouldHaveAttribute: aKey value: aValue [
	<category: 'conveniance'>
	self assert: (e attributes associations includes: aKey -> aValue)
    ]

    withContextDo: aBlock [
	<category: 'conveniance'>
	ILCurrentContext 
	    use: (ILContext new session: ILSession new)
	    during: aBlock
    ]

    testAttributes [
	<category: 'testing'>
	self assert: e attributes isEmpty.
	e attributeAt: 'foo' put: 'bar'.
	self shouldHaveAttribute: 'foo' value: 'bar'
    ]
    
    testTag [
	<category: 'testing'>
	self assert: e tag = nil
    ]
]

