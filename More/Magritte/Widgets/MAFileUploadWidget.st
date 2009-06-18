"======================================================================
|
|   Magritte.MAFileUploadWidget class definition
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



MAElementWidget subclass: MAFileUploadWidget [
    
    <comment: 'I''m the MAFileDescription Iliad widget.
    With me user can upload files to the server.
    I provide a button for the user to browse their
    computer for files.'>
    <category: 'Iliad-More-Magritte-Widgets'>

    MAFileUploadWidget class >> isAbstract [
	^false
    ]

    editorContents [
	<category: 'building'>
	^[:e | 
	    (self value isNil or: [self value isEmpty]) 
		ifTrue: [e build: self uploadContents]
		ifFalse: [e build: self removeContents]]
    ]

    removeContents [
	<category: 'building'>
	^[:e | 
	    e text: self value filename.
	    e text: ' (' , self value filesize asFileSize , ') '.
	    (e button)
		action: [self remove];
		text: 'remove']
    ]

    uploadContents [
	<category: 'building'>
	^[:e | 
	    (e fileInput)
		id: self labelId;
		action: [:val | self upload: val].
	    e button text: 'upload']
    ]

    viewerContents [
	<category: 'building'>
	^[:e | e text: self value]
    ]

    hasLabelId [
	<category: 'testing'>
	^self isReadonly not and: [self isMultipart]
    ]

    isMultipart [
	<category: 'testing'>
	^true
    ]

    remove [
	<category: 'actions'>
	self markDirty.
	self value ifNotNil: [self value finalize].
	self value: nil
    ]

    upload: aFile [
	<category: 'actions'>
	self markDirty.
	self value: ((aFile isKindOf: ILFileProxy) 
		    ifTrue: 
			[(self description kind new)
			    mimetype: aFile contentType;
			    filename: aFile filename;
			    contents: aFile contents;
			    yourself])
    ]
]

