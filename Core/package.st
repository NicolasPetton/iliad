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
	filein: 'Sessions/ILCurrentActionRegistry.st'; 
	filein: 'Sessions/ILActionRegistry.st'; 
	filein: 'Sessions/ILStateRegistry.st'; 
	filein: 'Sessions/ILSession.st'; 
	filein: 'Sessions/ILSessionManager.st'; 

	filein: 'Elements/ILElements-Error.st'; 
	filein: 'Elements/ILElement.st'; 
	filein: 'Elements/ILTextElement.st'; 
	filein: 'Elements/ILXmlElement.st'; 
	filein: 'Elements/Extensions.st'; 

	filein: 'XHTMLElements/ILXHTMLElement.st'; 
	filein: 'XHTMLElements/ILTitleElement.st'; 
	filein: 'XHTMLElements/ILBodyElement.st'; 
	filein: 'XHTMLElements/ILClosingElement.st'; 
	filein: 'XHTMLElements/ILAreaElement.st'; 
	filein: 'XHTMLElements/ILBreakElement.st'; 
	filein: 'XHTMLElements/ILHorizontalRuleElement.st'; 
	filein: 'XHTMLElements/ILImageElement.st'; 
	filein: 'XHTMLElements/ILMetaElement.st'; 
	filein: 'XHTMLElements/ILParameterElement.st'; 
	filein: 'XHTMLElements/ILDirectionElement.st'; 
	filein: 'XHTMLElements/ILDivElement.st'; 
	filein: 'XHTMLElements/ILFieldsetElement.st'; 
	filein: 'XHTMLElements/ILFormElement.st'; 
	filein: 'XHTMLElements/ILFormElementElement.st'; 
	filein: 'XHTMLElements/ILButtonElement.st'; 
	filein: 'XHTMLElements/ILCheckboxElement.st'; 
	filein: 'XHTMLElements/ILRadioButtonElement.st'; 
	filein: 'XHTMLElements/ILInputElement.st'; 
	filein: 'XHTMLElements/ILSelectElement.st'; 
	filein: 'XHTMLElements/ILTextAreaElement.st'; 
	filein: 'XHTMLElements/ILHeadElement.st'; 
	filein: 'XHTMLElements/ILHeadingElement.st'; 
	filein: 'XHTMLElements/ILHtmlElement.st'; 
	filein: 'XHTMLElements/ILLabelElement.st'; 
	filein: 'XHTMLElements/ILLegendElement.st'; 
	filein: 'XHTMLElements/ILLinkableElement.st'; 
	filein: 'XHTMLElements/ILAnchorElement.st'; 
	filein: 'XHTMLElements/ILLinkElement.st'; 
	filein: 'XHTMLElements/ILListElement.st'; 
	filein: 'XHTMLElements/ILListItemElement.st'; 
	filein: 'XHTMLElements/ILMapElement.st'; 
	filein: 'XHTMLElements/ILObjectElement.st'; 
	filein: 'XHTMLElements/ILOptionElement.st'; 
	filein: 'XHTMLElements/ILOptionGroupElement.st'; 
	filein: 'XHTMLElements/ILParagraphElement.st'; 
	filein: 'XHTMLElements/ILRawHtmlElement.st'; 
	filein: 'XHTMLElements/ILRubyTextElement.st'; 
	filein: 'XHTMLElements/ILScriptElement.st'; 
	filein: 'XHTMLElements/ILSpanElement.st'; 
	filein: 'XHTMLElements/ILTableElement.st'; 
	filein: 'XHTMLElements/ILTableElementElement.st'; 
	filein: 'XHTMLElements/ILTableBodyElement.st'; 
	filein: 'XHTMLElements/ILTableCellElement.st'; 
	filein: 'XHTMLElements/ILTableDataElement.st'; 
	filein: 'XHTMLElements/ILTableHeaderElement.st'; 
	filein: 'XHTMLElements/ILTableRowElement.st'; 
	filein: 'XHTMLElements/ILTableFootElement.st'; 
	filein: 'XHTMLElements/ILTableHeadElement.st'; 
	filein: 'XHTMLElements/ILConditionalCommentElement.st'; 

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
	filein: 'Buildables/ILXHTMLPage.st'; 

	filein: 'Dispatching/ILDispatchError.st';
	filein: 'Dispatching/ILDispatcher.st'; 
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
