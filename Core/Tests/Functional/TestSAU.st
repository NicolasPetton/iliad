Widget subclass: TestSAU [
    | counter count text editText checked dropped |
    
    <comment: nil>
    <category: 'Iliad-Tests-Functional'>

    TestSAU class >> path [
	^'scriptaculous'
    ]

    buildDraggableOn: aCanvas [
	<category: 'building'>
	| id1 id2 |
	id1 := aCanvas draggableId.
	id2 := aCanvas draggableId.
	aCanvas h1 text: 'Draggable'.
	(aCanvas div)
	    id: id1;
	    class: 'draggable';
	    passenger: 'Drag me!';
	    with: [aCanvas h2 text: 'Drag me!'].
	(aCanvas div)
	    id: id2;
	    class: 'draggable';
	    passenger: 'Drag me too!';
	    with: [aCanvas h2 text: 'Drag me too!'].
	aCanvas script: ((aCanvas draggable)
		    id: id1;
		    revert: true;
		    build).
	aCanvas script: ((aCanvas draggable)
		    id: id2;
		    revert: true;
		    build).
	(aCanvas div)
	    id: 'droppable';
	    with: [aCanvas text: 'Drop here :)'].
	aCanvas script: ((aCanvas droppable)
		    id: 'droppable';
		    accept: 'draggable';
		    hoverClass: 'hover';
		    onDrop: ((aCanvas updater)
				id: 'droppable';
				triggerPassenger: [:val | dropped := val];
				action: [:canvas | canvas text: dropped];
				yourself);
		    build)
    ]

    contents [
	<category: 'building'>
	self updatePage.
	^[:e | 
	e build: self effects.
	"self buildDraggableOn: anElement."
	e build: self sortable.
	e build: self updater.
	e build: self periodicalUpdater.
	e build: self form.
	e build: self inPlaceEditor]
    ]

    count [
	<category: 'building'>
	^[:e | e text: count printString]
    ]

    description [
	<category: 'building'>
	^'scriptaculous'
    ]

    effects [
	<category: 'building'>
	| div |
	^[:e | 
	e h1: 'Effects'.
	div := e div.
	div id: 'id'.
	div add: counter build.
	(e anchor)
	    href: 'javascript:void(0)';
	    onClick: ((div scriptaculous effect)
			id: 'id';
			duration: 2;
			afterFinish: ((div scriptaculous effect)
				    id: 'id';
				    highlight);
			appear;
			build);
	    text: 'Appear'.
	e text: ' '.
	(e anchor)
	    href: 'javascript:void(0)';
	    onClick: ((div scriptaculous effect)
			id: 'id';
			blindUp;
			build);
	    text: 'BlindUp'.
	e text: ' '.
	(e anchor)
	    href: 'javascript:void(0)';
	    onClick: ((div scriptaculous effect)
			id: 'id';
			toggleBlind;
			build);
	    text: 'ToggleBlind']
    ]

    form [
	<category: 'building'>
	| form |
	^[:e | 
	text ifNil: [text := 'some text'].
	e h1 text: 'Form'.
	form := e form.
	form id: 'form'.
	(form input)
	    action: [:val | text := val];
	    value: text.
	(form button)
	    onClick: ((form prototype updater)
			id: 'essai';
			triggerForm: 'form';
			return: false;
			build);
	    text: 'go'.
	(e div)
	    id: 'essai';
	    text: text]
    ]

    inPlaceEditor [
	<category: 'building'>
	| div |
	^[:e | 
	editText := 'Edit me :)'.
	e h1: 'In place Editor'.
	div := e div.
	div
	    id: 'edit';
	    text: editText.
	e javascript: ((div scriptaculous inPlaceEditor)
		    id: 'edit';
		    triggerInPlaceEditor: [:val | editText := val];
		    onComplete: ((e prototype updater)
				id: 'edit';
				action: [:f | f text: editText];
				yourself);
		    build)]
    ]

    periodicalUpdater [
	<category: 'building'>
	| div |
	^[:e | 
	e h1 text: 'PeriodicalUpdater'.
	div := e div.
	div id: 'periodical_update'.
	div build: self time.
	div javascript: ((div prototype periodicalUpdater)
		    id: 'periodical_update';
		    frequency: 1;
		    action: [:f | f build: self time];
		    build)]
    ]

    sortable [
	<category: 'building'>
	| div1 |
	^[:e | 
	e h1 text: 'sortable1'.
	div1 := e div id: 'sortable1'.
	(div1 div)
	    id: div1 sortableId;
	    passenger: 'Sort me!';
	    text: 'Sort me!'.
	(div1 div)
	    id: div1 sortableId;
	    passenger: 'Sort me too!';
	    text: 'Sort me too!'.
	e javascript: ((e scriptaculous sortable)
		    id: 'sortable1';
		    tag: 'div';
		    constraint: false;
		    dropOnEmpty: true;
		    onUpdate: ((e prototype updater)
				id: '';
				triggerSortable: 'sortable1' action: [:val | Transcript show: val];
				yourself);
		    build)]
    ]

    time [
	<category: 'building'>
	^[:e | e text: SpTimestamp now printString]
    ]

    updatePage [
	<category: 'building'>
	self page headElement javascript source: '/prototype/prototype.js'.
	self page headElement javascript source: '/scriptaculous/scriptaculous.js'
    ]

    updater [
	<category: 'building'>
	| div |
	^
	[:e | 
	e h1: 'Updater'.
	count ifNil: [count := 0].
	div := e div.
	div id: 'update'.
	div build: self count.
	(e anchor)
	    href: 'javascript:void(0)';
	    onClick: ((e prototype updater)
			id: 'update';
			action: 
				[:f | 
				count := count + 1.
				f build: self count.
				f];
			build);
	    text: 'increase']
    ]

    children [
	<category: 'accessing'>
	^Array with: counter
    ]

    initialize [
	<category: 'initialize-release'>
	super initialize.
	counter := Counter new
    ]
]

