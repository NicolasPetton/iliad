Eval [
    | builder pubDir |  
    builder := PackageBuilder new
	name: 'Iliad-Core';
	namespace: 'Iliad';
	prereq: 'Iconv';
	filein: 'Utilities/IliadObject.st';
	filein: 'Utilities/SmallDictionary.st';
	filein: 'Utilities/Composite.st';
	filein: 'Utilities/DynamicVariable.st';
	filein: 'Utilities/Support.st'; 
	filein: 'Utilities/Id.st'; 
	filein: 'Utilities/Encoder.st'; 
	filein: 'Utilities/GSTEncoder.st'; 
	filein: 'Utilities/ModelProxy.st'; 

	filein: 'lib/HTTP/ILUrl.st'; 
	filein: 'lib/HTTP/ILFileProxy.st'; 
	filein: 'lib/HTTP/ILRequest.st'; 
	filein: 'lib/HTTP/ILResponse.st';
	filein: 'lib/HTTP/ILCookie.st'; 

	filein: 'lib/JSON/ILJsonSyntaxError.st'; 
	filein: 'lib/JSON/ILJson.st'; 
	filein: 'lib/JSON/Extensions.st'; 

	filein: 'Sessions/UrlBuilder.st'; 
	filein: 'Sessions/Context.st'; 
	filein: 'Sessions/Action.st'; 
	filein: 'Sessions/CurrentContext.st'; 
	filein: 'Sessions/CurrentActionRegistry.st'; 
	filein: 'Sessions/ActionRegistry.st'; 
	filein: 'Sessions/Session.st'; 
	filein: 'Sessions/SessionManager.st'; 

	filein: 'Elements/ILElements-Error.st'; 
	filein: 'Elements/ILElement.st'; 
	filein: 'Elements/ILTextElement.st'; 
	filein: 'Elements/Extensions.st'; 

	filein: 'XHTMLElements/XHTMLElement.st'; 
	filein: 'XHTMLElements/TitleElement.st'; 
	filein: 'XHTMLElements/BodyElement.st'; 
	filein: 'XHTMLElements/ClosingElement.st'; 
	filein: 'XHTMLElements/AreaElement.st'; 
	filein: 'XHTMLElements/BreakElement.st'; 
	filein: 'XHTMLElements/HorizontalRuleElement.st'; 
	filein: 'XHTMLElements/ImageElement.st'; 
	filein: 'XHTMLElements/MetaElement.st'; 
	filein: 'XHTMLElements/ParameterElement.st'; 
	filein: 'XHTMLElements/DirectionElement.st'; 
	filein: 'XHTMLElements/DivElement.st'; 
	filein: 'XHTMLElements/FieldsetElement.st'; 
	filein: 'XHTMLElements/FormElement.st'; 
	filein: 'XHTMLElements/FormElementElement.st'; 
	filein: 'XHTMLElements/ButtonElement.st'; 
	filein: 'XHTMLElements/CheckboxElement.st'; 
	filein: 'XHTMLElements/RadioButtonElement.st'; 
	filein: 'XHTMLElements/InputElement.st'; 
	filein: 'XHTMLElements/SelectElement.st'; 
	filein: 'XHTMLElements/TextAreaElement.st'; 
	filein: 'XHTMLElements/HeadElement.st'; 
	filein: 'XHTMLElements/HeadingElement.st'; 
	filein: 'XHTMLElements/HtmlElement.st'; 
	filein: 'XHTMLElements/LabelElement.st'; 
	filein: 'XHTMLElements/LegendElement.st'; 
	filein: 'XHTMLElements/LinkableElement.st'; 
	filein: 'XHTMLElements/AnchorElement.st'; 
	filein: 'XHTMLElements/LinkElement.st'; 
	filein: 'XHTMLElements/ListElement.st'; 
	filein: 'XHTMLElements/ListItemElement.st'; 
	filein: 'XHTMLElements/MapElement.st'; 
	filein: 'XHTMLElements/ObjectElement.st'; 
	filein: 'XHTMLElements/OptionElement.st'; 
	filein: 'XHTMLElements/OptionGroupElement.st'; 
	filein: 'XHTMLElements/ParagraphElement.st'; 
	filein: 'XHTMLElements/RawHtmlElement.st'; 
	filein: 'XHTMLElements/RubyTextElement.st'; 
	filein: 'XHTMLElements/ScriptElement.st'; 
	filein: 'XHTMLElements/SpanElement.st'; 
	filein: 'XHTMLElements/TableElement.st'; 
	filein: 'XHTMLElements/TableElementElement.st'; 
	filein: 'XHTMLElements/TableBodyElement.st'; 
	filein: 'XHTMLElements/TableCellElement.st'; 
	filein: 'XHTMLElements/TableDataElement.st'; 
	filein: 'XHTMLElements/TableHeaderElement.st'; 
	filein: 'XHTMLElements/TableRowElement.st'; 
	filein: 'XHTMLElements/TableFootElement.st'; 
	filein: 'XHTMLElements/TableHeadElement.st'; 

	filein: 'Buildables/ILExtensions.st';  
	filein: 'Buildables/ILBuildable.st'; 
	filein: 'Buildables/ILDecorator.st'; 
	filein: 'Buildables/ILAnswerHandler.st'; 
	filein: 'Buildables/ILDelegator.st'; 
	filein: 'Buildables/ILWidget.st'; 
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
	filein: 'RequestHandlers/ILFileHandler.st'; 
	filein: 'RequestHandlers/ILNotFoundHandler.st'; 
	filein: 'RequestHandlers/ILJsonHandler.st'; 
	filein: 'RequestHandlers/ILApplicationHandler.st'; 
	filein: 'RequestHandlers/ILRedirectHandler.st';
	yourself.

    pubDir := Directory working / 'Public'.
    pubDir all do: [:each |
	each isFile ifTrue: [
	    builder resource: (each pathFrom: Directory working)]].

    builder buildXml
]
