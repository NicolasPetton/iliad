ILWidget subclass: ILDevelopmentTool [
    | tabs transcript workspace browser |

    <category: 'Iliad-More-DevelopmentTools'>
    <comment: 'nil'>

    tabs [
	<category: 'accessing'>
	^tabs ifNil: [
	    tabs := ILWidgetTabs new
		items: {self workspace};
		labelBlock: [:item | item label];
		yourself]
    ]

    workspace [
	<category: 'accessing'>
	^workspace ifNil: [workspace := ILWorkspace new]
    ]

    styles [
	<category: 'building'>
	^#('/stylesheets/stylesheets/iliad_dev.css')
    ]

    contents [
	<category: 'building'>
	^[:e |
	    e div 
		class: 'development_tool';
		build: self tabs]
    ]

]
