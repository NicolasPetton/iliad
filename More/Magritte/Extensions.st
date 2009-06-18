"======================================================================
|
|   Magritte classes extensions
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2009 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
| Adapted from Magritte-Seaside written by Lukas Renggli 
| http://source.lukas-renggli.ch/magritte.
|
| This file is part of the Iliad framework.
|
| Permission is hereby granted, free of charge, to any person obtaining
| a copy of this software and associated documentation files (the 
| 'Software'), to deal in the Software without restriction, including 
| without limitation the rights to use, copy, modify, merge, publish, 
| distribute, sublicense, and/or sell copies of the Software, and to 
| permit persons to whom the Software is furnished to do so, subject to 
| the following conditions:
|
| The above copyright notice and this permission notice shall be 
| included in all copies or substantial portions of the Software.
|
| THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, 
| EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
| MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
| IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
| CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
| TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
| SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  
|
 ======================================================================"



Iliad.Widget extend [
    
    isMagritteContainer [
	<category: '*Iliad-More-Magritte'>
	^false
    ]
]

Object extend [
    
    asWidget [
	<category: '*Iliad-More-Magritte'>
	^self description asWidgetOn: self
    ]
]

MADescription extend [
    
    MADescription class >> defaultCssClasses [
	<category: '*Iliad-More-Magritte'>
	^OrderedCollection new
    ]

    MADescription class >> defaultReportColumnWidgetClass [
	<category: '*Iliad-More-Magritte'>
	^self defaultReportColumnWidgetClasses notEmpty
	    ifTrue: [self defaultReportColumnWidgetClasses first]
    ]

    MADescription class >> defaultReportColumnWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MADescribedColumnWidget
    ]

    MADescription class >> defaultWidgetClass [
	<category: '*Iliad-More-Magritte'>
	^self defaultWidgetClasses notEmpty
		ifTrue: [self defaultWidgetClasses first]
		ifFalse: [MAUndefinedWidget]
    ]

    MADescription class >> defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MAUndefinedWidget
    ]

    MADescription class >> descriptionReportColumnWidgetClass [
	<category: '*Iliad-More-Magritte'>
	^MASingleOptionDescription new
	    accessor: #reportColumnWidgetClass;
	    label: 'Report Column Class';
	    priority: 1010;
	    reference: MAClassDescription new;
	    options: self defaultReportColumnWidgetClasses;
	    default: self defaultReportColumnWidgetClass;
	    yourself
    ]

    MADescription class >> descriptionWidgetClass [
	<category: '*Iliad-More-Magritte'>
	^MASingleOptionDescription new
	    accessor: #widgetClass;
	    label: 'Component Class';
	    reference: MAClassDescription new;
	    options: self defaultWidgetClasses;
	    default: self defaultWidgetClass;
	    priority: 1000;
	    yourself
    ]

    cssClass: aString [
	<category: '*Iliad-More-Magritte'>
	(self propertyAt: #cssClasses ifAbsentPut: [self class defaultCssClasses])
	    add: aString
    ]

    cssClasses [
	<category: '*Iliad-More-Magritte'>
	^self propertyAt: #cssClasses ifAbsent: [self class defaultCssClasses]
    ]

    cssClasses: aCollection [
	<category: '*Iliad-More-Magritte'>
	self propertyAt: #cssClasses put: aCollection
    ]

    reportColumnWidgetClass [
	<category: '*Iliad-More-Magritte'>
	^self propertyAt: #reportColumnWidgetClass ifAbsent: [
	    self class defaultReportColumnWidgetClass]
    ]

    reportColumnWidgetClass: aClass [
	<category: '*Iliad-More-Magritte'>
	^self propertyAt: #reportColumnWidgetClass put: aClass
    ]

    widgetClass [
	<category: '*Iliad-More-Magritte'>
	^self 
	    propertyAt: #widgetClass 
	    ifAbsent: [self class defaultWidgetClass]
    ]

    widgetClass: aClass [
	<category: '*Iliad-More-Magritte'>
	^self propertyAt: #widgetClass put: aClass
    ]
]

MAContainer extend [
    
    MAContainer class >> defaultWidgetBuilder [
	<category: '*Iliad-More-Magritte'>
	^MATableBuilder
    ]

    MAContainer class >> defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MAContainerWidget
    ]

    asWidgetOn: anObject [
	<category: '*Iliad-More-Magritte'>
	^self widgetClass
	    memento: (anObject mementoClass
		model: anObject
		description: self)
    ]

    widgetBuilder [
	<category: '*Iliad-More-Magritte'>
	^self 
	    propertyAt: #widgetBuilder 
	    ifAbsent: [self class defaultWidgetBuilder]
    ]

    widgetBuilder: aClass [
	<category: '*Iliad-More-Magritte'>
	self propertyAt: #widgetBuilder put: aClass
    ]
]

MABooleanDescription class extend [
    
    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MACheckboxWidget with: MASelectListWidget
    ]
]

MADateDescription class extend [

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^ Array with: MADateSelectorWidget
    ]

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^ Array with: MADateSelectorWidget
    ]
]

MAElementDescription class extend [

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MATextInputWidget
    ]
]

MAFileDescription class extend [

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MAFileUploadWidget
    ]
]

MAMemoDescription class extend [

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MATextAreaWidget
    ]
]

MAMultipleOptionDescription class extend [

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MAMultiselectListWidget with: MACheckboxGroupWidget
    ]
]

MAPasswordDescription class extend [

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array 
	    with: MATextPasswordWidget 
	    with: MAVerifiedPasswordWidget
	    with: MATextInputWidget
    ]
]

MASingleOptionDescription class extend [

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MASelectListWidget
    ]
]

MATimeDescription class extend [

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MATimeSelectorWidget
    ]
]

MATimeStampDescription class extend [

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MATimeStampSelectorWidget
    ]
]

MAToOneRelationDescription class extend [

    defaultWidgetClasses [
	<category: '*Iliad-More-Magritte'>
	^Array with: MAExternalEditorWidget with: MAInternalEditorWidget
    ]
]
