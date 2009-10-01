

RSSElement subclass: RSSCategoryElement [
    
    <comment: nil>
    <category: 'Iliad-More-RSS'>

    tag [
	<category: 'accessing'>
	^'category'
    ]

    domain: anUrl [
	<category: 'accessing attributes'>
	self attributeAt: 'domain' put: anUrl asString
    ]
]

