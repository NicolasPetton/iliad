ElementTest subclass: RSSElementTest [
    
    <comment: nil>
    <category: 'Iliad-Tests-Unit-RSS'>

    setUp [
	<category: 'running'>
	e := RSSElement new
    ]

    testAuthor [
	<category: 'testing'>
	| author |
	author := e author.
	self assert: (author isKindOf: RSSElement).
	self assert: author tag = 'author'
    ]

    testCategory [
	<category: 'testing'>
	| category |
	category := e category.
	self assert: (category isKindOf: RSSCategoryElement)
    ]

    testChannel [
	<category: 'testing'>
	| channel |
	channel := e channel.
	self assert: (channel isKindOf: RSSElement).
	self assert: channel tag = 'channel'
    ]

    testCloud [
	<category: 'testing'>
	| cloud |
	cloud := e cloud.
	self assert: (cloud isKindOf: RSSCloudElement)
    ]

    testComment [
	<category: 'testing'>
	| comment |
	comment := e comment.
	self assert: (comment isKindOf: RSSElement).
	self assert: comment tag = 'wfw:comment'
    ]

    testComments [
	<category: 'testing'>
	| comments |
	comments := e comments.
	self assert: (comments isKindOf: RSSCommentsElement)
    ]

    testCopyright [
	<category: 'testing'>
	| copyright |
	copyright := e copyright.
	self assert: (copyright isKindOf: RSSElement).
	self assert: copyright tag = 'copyright'
    ]

    testDescription [
	<category: 'testing'>
	| description |
	description := e description.
	self assert: (description isKindOf: RSSElement).
	self assert: description tag = 'description'
    ]

    testEnclosure [
	<category: 'testing'>
	| enclosure |
	enclosure := e enclosure.
	self assert: (enclosure isKindOf: RSSEnclosureElement)
    ]

    testGenerator [
	<category: 'testing'>
	| generator |
	generator := e generator.
	self assert: (generator isKindOf: RSSElement).
	self assert: generator tag = 'generator'
    ]

    testGuid [
	<category: 'testing'>
	| guid |
	guid := e guid.
	self assert: (guid isKindOf: RSSGuidElement)
    ]

    testImage [
	<category: 'testing'>
	| image |
	image := e image.
	self assert: (image isKindOf: RSSElement).
	self assert: image tag = 'image'
    ]

    testItem [
	<category: 'testing'>
	| item |
	item := e item.
	self assert: (item isKindOf: RSSElement).
	self assert: item tag = 'item'
    ]

    testLanguage [
	<category: 'testing'>
	| language |
	language := e language.
	self assert: (language isKindOf: RSSElement).
	self assert: language tag = 'language'
    ]

    testLastBuildDate [
	<category: 'testing'>
	| lastBuildDate |
	lastBuildDate := e lastBuildDate.
	self assert: (lastBuildDate isKindOf: RSSElement).
	self assert: lastBuildDate tag = 'lastBuildDate'
    ]

    testLink [
	<category: 'testing'>
	| link |
	link := e link.
	self assert: (link isKindOf: RSSElement).
	self assert: link tag = 'link'
    ]

    testManagingEditor [
	<category: 'testing'>
	| managingEditor |
	managingEditor := e managingEditor.
	self assert: (managingEditor isKindOf: RSSElement).
	self assert: managingEditor tag = 'managingEditor'
    ]

    testPubDate [
	<category: 'testing'>
	| pubDate |
	pubDate := e pubDate.
	self assert: (pubDate isKindOf: RSSElement).
	self assert: pubDate tag = 'pubDate'
    ]

    testRating [
	<category: 'testing'>
	| rating |
	rating := e rating.
	self assert: (rating isKindOf: RSSElement).
	self assert: rating tag = 'rating'
    ]

    testRss [
	<category: 'testing'>
	| rss |
	rss := e rss.
	self assert: (rss isKindOf: RSSRssElement)
    ]

    testSkipDays [
	<category: 'testing'>
	| skipDays |
	skipDays := e skipDays.
	self assert: (skipDays isKindOf: RSSElement).
	self assert: skipDays tag = 'skipDays'
    ]

    testSkipHours [
	<category: 'testing'>
	| skipHours |
	skipHours := e skipHours.
	self assert: (skipHours isKindOf: RSSElement).
	self assert: skipHours tag = 'skipHours'
    ]

    testSource [
	<category: 'testing'>
	| source |
	source := e source.
	self assert: (source isKindOf: RSSSourceElement)
    ]

    testTextInput [
	<category: 'testing'>
	| textInput |
	textInput := e textInput.
	self assert: (textInput isKindOf: RSSElement).
	self assert: textInput tag = 'textInput'
    ]

    testTitle [
	<category: 'testing'>
	| title |
	title := e title.
	self assert: (title isKindOf: RSSElement).
	self assert: title tag = 'title'
    ]

    testTtl [
	<category: 'testing'>
	| ttl |
	ttl := e ttl.
	self assert: (ttl isKindOf: RSSElement).
	self assert: ttl tag = 'ttl'
    ]

    testWebMaster [
	<category: 'testing'>
	| webMaster |
	webMaster := e webMaster.
	self assert: (webMaster isKindOf: RSSElement).
	self assert: webMaster tag = 'webMaster'
    ]
]

