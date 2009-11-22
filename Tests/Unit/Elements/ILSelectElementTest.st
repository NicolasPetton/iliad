
ILElementTest subclass: ILSelectElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	"Need a current session and action registry during ILSelectElement initialization"
	<category: 'running'>
	
	ILCurrentContext
	    use: (ILContext new session: ILSession new)
	    during: [ILCurrentActionRegistry
		use: ILActionRegistry new
		during: [e := ILSelectElement new]]
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

