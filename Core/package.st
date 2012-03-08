Eval [
    | builder pubDir |  
    builder := PackageBuilder new
	name: 'Iliad-Core';
	namespace: 'Iliad';
	prereq: 'Iconv';
	prereq: 'Grease';
	filein: 'Utilities/ILObject.st';
	filein: 'Utilities/ILComposite.st';
	filein: 'Utilities/ILDynamicVariable.st';
	filein: 'Utilities/ILId.st'; 
	filein: 'Utilities/UUID.st'; 
	filein: 'Utilities/ILEncoder.st'; 
	filein: 'Utilities/ILModelProxy.st'; 

	filein: 'lib/HTTP/ILUrl.st'; 
	filein: 'lib/HTTP/ILFileProxy.st'; 
	filein: 'lib/HTTP/ILRequest.st'; 
	filein: 'lib/HTTP/ILResponse.st';
	filein: 'lib/HTTP/ILCookie.st'; 

	filein: 'lib/JSON/ILJsonSyntaxError.st'; 
	filein: 'lib/JSON/ILJson.st'; 
	filein: 'lib/JSON/ILJsonObject.st'; 
	filein: 'lib/JSON/Extensions.st'; 

	filein: 'Sessions/ILUrlBuilder.st'; 
	filein: 'Sessions/ILContext.st'; 
	filein: 'Sessions/ILAction.st'; 
	filein: 'Sessions/ILCurrentContext.st'; 
	filein: 'Sessions/ILActionRegistry.st'; 
	filein: 'Sessions/ILStateRegistry.st'; 
	filein: 'Sessions/ILSession.st'; 
	filein: 'Sessions/ILSessionManager.st'; 

	filein: 'Elements/ILElements-Error.st'; 
	filein: 'Elements/ILElement.st'; 
	filein: 'Elements/ILTextElement.st'; 
	filein: 'Elements/ILXmlElement.st'; 
	filein: 'Elements/Extensions.st'; 

	filein: 'HTMLElements/ILHTMLBuilderElement.st'; 
	filein: 'HTMLElements/ILTitleElement.st'; 
	filein: 'HTMLElements/ILBodyElement.st'; 
	filein: 'HTMLElements/ILClosingElement.st'; 
	filein: 'HTMLElements/ILAreaElement.st'; 
	filein: 'HTMLElements/ILBreakElement.st'; 
	filein: 'HTMLElements/ILHorizontalRuleElement.st'; 
	filein: 'HTMLElements/ILImageElement.st'; 
	filein: 'HTMLElements/ILIframeElement.st'; 
	filein: 'HTMLElements/ILMetaElement.st'; 
	filein: 'HTMLElements/ILParameterElement.st'; 
	filein: 'HTMLElements/ILDirectionElement.st'; 
	filein: 'HTMLElements/ILDivElement.st'; 
	filein: 'HTMLElements/ILFieldsetElement.st'; 
	filein: 'HTMLElements/ILFormElement.st'; 
	filein: 'HTMLElements/ILFormElementElement.st'; 
	filein: 'HTMLElements/ILButtonElement.st'; 
	filein: 'HTMLElements/ILCheckboxElement.st'; 
	filein: 'HTMLElements/ILRadioButtonElement.st'; 
	filein: 'HTMLElements/ILInputElement.st'; 
	filein: 'HTMLElements/ILSelectElement.st'; 
	filein: 'HTMLElements/ILTextAreaElement.st'; 
	filein: 'HTMLElements/ILHeadElement.st'; 
	filein: 'HTMLElements/ILHeadingElement.st'; 
	filein: 'HTMLElements/ILHtmlElement.st'; 
	filein: 'HTMLElements/ILLabelElement.st'; 
	filein: 'HTMLElements/ILLegendElement.st'; 
	filein: 'HTMLElements/ILLinkableElement.st'; 
	filein: 'HTMLElements/ILAnchorElement.st'; 
	filein: 'HTMLElements/ILLinkElement.st'; 
	filein: 'HTMLElements/ILListElement.st'; 
	filein: 'HTMLElements/ILListItemElement.st'; 
	filein: 'HTMLElements/ILMapElement.st'; 
	filein: 'HTMLElements/ILObjectElement.st'; 
	filein: 'HTMLElements/ILOptionElement.st'; 
	filein: 'HTMLElements/ILOptionGroupElement.st'; 
	filein: 'HTMLElements/ILParagraphElement.st'; 
	filein: 'HTMLElements/ILRawHtmlElement.st'; 
	filein: 'HTMLElements/ILRubyTextElement.st'; 
	filein: 'HTMLElements/ILScriptElement.st'; 
	filein: 'HTMLElements/ILSpanElement.st'; 
	filein: 'HTMLElements/ILTableElement.st'; 
	filein: 'HTMLElements/ILTableElementElement.st'; 
	filein: 'HTMLElements/ILTableBodyElement.st'; 
	filein: 'HTMLElements/ILTableCellElement.st'; 
	filein: 'HTMLElements/ILTableDataElement.st'; 
	filein: 'HTMLElements/ILTableHeaderElement.st'; 
	filein: 'HTMLElements/ILTableRowElement.st'; 
	filein: 'HTMLElements/ILTableFootElement.st'; 
	filein: 'HTMLElements/ILTableHeadElement.st'; 
	filein: 'HTMLElements/ILConditionalCommentElement.st'; 

	filein: 'Buildables/Extensions.st';  
	filein: 'Buildables/ILBuildable.st'; 
	filein: 'Buildables/ILDecorator.st'; 
	filein: 'Buildables/ILAnswerHandler.st'; 
	filein: 'Buildables/ILDelegator.st'; 
	filein: 'Buildables/ILAppendDelegator.st'; 
	filein: 'Buildables/ILPrependDelegator.st'; 
	filein: 'Buildables/ILWidget.st'; 
	filein: 'Buildables/ILSequence.st'; 
	filein: 'Buildables/ILInformationWidget.st'; 
	filein: 'Buildables/ILConfirmationWidget.st'; 
	filein: 'Buildables/ILPluggableWidget.st';
	filein: 'Buildables/ILProfiler.st'; 
	filein: 'Buildables/ILApplication.st'; 
	filein: 'Buildables/ILHTMLPage.st'; 
	filein: 'Buildables/ILCurrentBuildable.st'; 

	filein: 'Dispatching/ILDispatchError.st';
	filein: 'Dispatching/ILDispatcher.st'; 
	filein: 'Dispatching/ILRouter.st'; 
	filein: 'Dispatching/ILRoute.st'; 

	filein: 'RequestHandlers/ILResponseNotification.st';
	filein: 'RequestHandlers/ILRequestHandler.st';
	filein: 'RequestHandlers/ILErrorHandler.st';   
	filein: 'RequestHandlers/ILDirectory.st'; 
	filein: 'RequestHandlers/ILMemoryDirectory.st'; 
	filein: 'RequestHandlers/ILFileHandler.st'; 
	filein: 'RequestHandlers/ILNotFoundHandler.st'; 
	filein: 'RequestHandlers/ILJsonHandler.st'; 
	filein: 'RequestHandlers/ILApplicationHandler.st'; 
	filein: 'RequestHandlers/ILRedirectHandler.st';

	filein: 'GST/ILDiskDirectory.st';
	filein: 'GST/Extensions.st';

	filein: 'postLoad.st';

	yourself.

    pubDir := Directory working / 'Public'.
    pubDir all do: [:each |
	each isFile ifTrue: [
	    builder resource: (each pathFrom: Directory working)]].

    builder buildXml
]
