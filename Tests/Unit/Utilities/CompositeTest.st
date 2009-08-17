TestCase subclass: CompositeTest [
    
    <comment: nil>
    <category: 'Iliad-Core-Tests-Utilities'>

    testAdd [
	<category: 'testing'>
	| composite child1 child2 children |
	children := OrderedCollection new.
	composite := Composite new.
	child1 := Composite new.
	child2 := Composite new.
	composite add: child1.
	composite childrenDo: [:each | children add: each].
	self assert: children size = 1.
	self assert: (children includes: child1).
	composite add: child2.
	children := OrderedCollection new.
	composite childrenDo: [:each | children add: each].
	self assert: children size = 2.
	self assert: (children includes: child1).
	self assert: (children includes: child2)
    ]

    testAllChildren [
	<category: 'testing'>
	| c1 c2 c3 c4 c5 c6 res |
	c1 := Composite new.
	c2 := Composite new.
	c3 := Composite new.
	c4 := Composite new.
	c5 := Composite new.
	c6 := Composite new.
	c1 add: c2.
	c1 add: c3.
	c2 add: c4.
	c2 add: c5.
	c3 add: c6.
	res := OrderedCollection new.
	"Recursively collect all children"
	c1 allChildrenDo: [:each | res add: each].
	self assert: (res includes: c2).
	self assert: (res includes: c3).
	self assert: (res includes: c4).
	self assert: (res includes: c5).
	self assert: (res includes: c6)
    ]

    testChildren [
	<category: 'testing'>
	| c1 c2 c3 res |
	c1 := Composite new.
	c2 := Composite new.
	c3 := Composite new.
	c1 add: c2.
	c1 add: c3.
	res := OrderedCollection new.
	c1 childrenDo: [:each | res add: each].
	self assert: (res includes: c2).
	self assert: (res includes: c3)
    ]
]

