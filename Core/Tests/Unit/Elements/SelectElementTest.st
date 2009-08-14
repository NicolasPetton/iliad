ElementTest subclass: SelectElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	"Need a current session and action registry during SelectElement initialization"
	<category: 'running'>
	
	CurrentContext
	    use: (Context new session: Session new)
	    during: [CurrentActionRegistry
		use: ActionRegistry new
		during: [e := SelectElement new]]
    ]

    testBeMultiple [
	<category: 'testing'>
	e beMultiple.
	self shouldHaveAttribute: 'multiple' value: 'multiple'
    ]

    testSize [
	<category: 'testing'>
	e size: 10.
	self shouldHaveAttribute: 'size' value: '10'
    ]

    testdisabled [
	<category: 'testing'>
	e disabled.
	self shouldHaveAttribute: 'disabled' value: 'disabled'
    ]
]

