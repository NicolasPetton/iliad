"======================================================================
|
|   Iliad.ILErrorHandler class definition
|
 ======================================================================"

"======================================================================
|
| Copyright (c) 2008-2010 
| Nicolas Petton <petton.nicolas@gmail.com>,
| Sébastien Audier <sebastien.audier@gmail.com>
|
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



ILRequestHandler subclass: ILErrorHandler [
    | error |
    
    <category: 'Iliad-Core-RequestHandlers'>
    <comment: '
    
""""""""""""""""""""""""
" Error handling modes "
""""""""""""""""""""""""

Error handlers can be in one of the following modes: deployment, verbose or 
debug. The default mode is verbose.
You can switch between modes with class methods in the <accessing modes> 
protocol.

When errors occur, the framework with handle them differently depending on 
the application mode:
- in deployment mode, it will respond an error 500;
- in verbose mode, it will also respond an error 500, but with error details;
- in debug mode, a debugger window will be opened on the error;'>

    ILErrorHandler class [
	| mode |
 
        mode [
	    <category: 'accessing'>
	    ^mode ifNil: [mode := #verbose]
	]
    
	mode: aSymbol [
	    <category: 'accessing'>
	    mode := aSymbol
	] 
    
	verboseMode [
	    <category: 'accessing modes'>
	    self mode: #verbose
	]
    
	debugMode [
	    <category: 'accessing modes'>
	    self mode: #debug
	]

	deploymentMode [
	    <category: 'accessing modes'>
	    self mode: #deployment
	]

    ]

    error [
	<category: 'accessing'>
	^error
    ]

    error: anError [
	<category: 'accessing'>
	error := anError
    ]

    mode [
	<category: 'accessing'>
	^self class mode
    ]

    newResponse [
	<category: 'accessing'>
	^ILResponse new
	    status: 500;
	    yourself
    ]

    produceResponse [
	<category: 'responding'>
	self isDebugMode ifTrue: [
	    self produceDebugResponse].
	self isVerboseMode ifTrue: [
	    self produceVerboseResponse].
	self isDeploymentMode ifTrue: [
	    self produceDeploymentResponse]
    ]

    produceDeploymentResponse [
	<category: 'responding'>
	self respond: [:response | 
	    response nextPutAll: '<html><h1>Error 500: Internal server error</h1></html>']
    ]

    produceDebugResponse [
	<category: 'responding'>
	self error resignalAsUnhandled: self error messageText
    ]

    produceVerboseResponse [
	<category: 'responding'>
	| info |
	info := WriteStream on: ''. 
	self respond: [:response || page e |
	    response nextPutAll: (String streamContents: [:stream |
		page := ILXHTMLPage new.
		page body h1: 'Internal Error';
		    h2: self error description;
		    h3: self error messageText.
		self error examineOn: info.
		info nextPut: Character cr.
		self error resumeContext backtraceOn: info.
		page body pre: info contents.
		Transcript show: info contents; cr.
		page build printHtmlOn: stream])]
    ]


    isDebugMode [
        <category: 'testing'>
        ^self mode = #debug
    ]
    
    isVerboseMode [
        <category: 'testing'>
        ^self mode = #verbose
    ]

    isDeploymentMode [
        <category: 'testing'>
        ^self isDebugMode not and: [
    	self isVerboseMode not]
    ]
]

Signal extend [
    resumeContext [
	^resumeBlock outerContext home
    ]
]
