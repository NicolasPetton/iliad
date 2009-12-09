ILDelegator subclass: ILDevelopmentDecorator [
    | developmentTool |

    <category: 'Iliad-More-DevelopmentTools'>

    developmentTool [
	<category: 'accessing'>
	^developmentTool ifNil: [
	    developmentTool := ILDevelopmentTool new]
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e 
		build: self developmentTool;
		build: self decoratee]
    ]
]
