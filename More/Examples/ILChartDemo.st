ILChart subclass: ILChartDemo [

    <category: 'More-Examples'>
    <comment: nil>


    data1 [
	<category: 'accessing'>
	^{1@2. 2@3. 3@4. 4@5}
    ]

    data2 [
	<category: 'accessing'>
	^{1@4. 2@3. 3@1. 4@2. 5@3}
    ]

    data3 [
	<category: 'accessing'>
	^{1@5. 2@6. 3@3. 4@2. 5@6. 1@5}
    ]

    data4 [
	<category: 'accessing'>
	| data |
	data := OrderedCollection new.
	1 to 50 do: [:each |
	    data add: each@(1+9 atRandom)].
	^data
    ]
]
