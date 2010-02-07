ILApplication subclass: ILChartApplication [
    | chart |

    <comment: nil>
    <category: 'Iliad-More-Examples'>

    ILChartApplication class >> path [
	^'/examples/charts'
    ]

    chart [
	<category: 'accessing'>
	^chart ifNil: [
	    chart := ILChart new 
		addData: {1@2. 2@4. 3@6. 4@8};
		addData: {1@1. 2@2. 3@3. 4@4};
		yourself]
    ]

    index [
	<category: 'controllers'>
	^self chart
    ]
]
