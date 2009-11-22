
ILElementTest subclass: ILTableElementElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-Elements'>

    setUp [
	<category: 'running'>
	e := ILTableElementElement new
    ]

    testAlignment [
	<category: 'testing'>
	e align: 'foo'.
	self shouldHaveAttribute: 'align' value: 'foo'
    ]

    testAttributes [
	<category: 'testing'>
	e centerAlign.
	self shouldHaveAttribute: 'align' value: 'center'.
	e rightAlign.
	self shouldHaveAttribute: 'align' value: 'right'.
	e bottomValign.
	self shouldHaveAttribute: 'valign' value: 'bottom'.
	e characterAlign.
	self shouldHaveAttribute: 'align' value: 'char'.
	e leftAlign.
	self shouldHaveAttribute: 'align' value: 'left'.
	e middleValign.
	self shouldHaveAttribute: 'valign' value: 'middle'.
	e topValign.
	self shouldHaveAttribute: 'valign' value: 'top'.
	e baselineValign.
	self shouldHaveAttribute: 'valign' value: 'baseline'.
	e justifyAlign.
	self shouldHaveAttribute: 'align' value: 'justify'
    ]

    testVerticalAlignment [
	<category: 'testing'>
	e valign: 'foo'.
	self shouldHaveAttribute: 'valign' value: 'foo'
    ]
]

