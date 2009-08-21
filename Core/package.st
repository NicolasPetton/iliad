Eval [
  PackageBuilder new
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

    filein: 'lib/HTTP/Url.st'; 
    filein: 'lib/HTTP/FileProxy.st'; 
    filein: 'lib/HTTP/Request.st'; 
    filein: 'lib/HTTP/Response.st';
    filein: 'lib/HTTP/Cookie.st'; 

    filein: 'lib/JSON/JsonSyntaxError.st'; 
    filein: 'lib/JSON/Json.st'; 
    filein: 'lib/JSON/Extensions.st'; 

    filein: 'Sessions/UrlBuilder.st'; 
    filein: 'Sessions/Context.st'; 
    filein: 'Sessions/Action.st'; 
    filein: 'Sessions/CurrentContext.st'; 
    filein: 'Sessions/CurrentActionRegistry.st'; 
    filein: 'Sessions/ActionRegistry.st'; 
    filein: 'Sessions/Session.st'; 
    filein: 'Sessions/SessionManager.st'; 

    filein: 'Elements/Elements-Error.st'; 
    filein: 'Elements/Element.st'; 
    filein: 'Elements/Extensions.st'; 

    filein: 'XHTMLElements/TextElement.st'; 
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
    filein: 'XHTMLElements/TableColumnElementElement.st'; 
    filein: 'XHTMLElements/TableFootElement.st'; 
    filein: 'XHTMLElements/TableHeadElement.st'; 

    filein: 'Buildables/Extensions.st';  
    filein: 'Buildables/Buildable.st'; 
    filein: 'Buildables/Decorator.st'; 
    filein: 'Buildables/AnswerHandler.st'; 
    filein: 'Buildables/Delegator.st'; 
    filein: 'Buildables/MessageDecorator.st'; 
    filein: 'Buildables/Widget.st'; 
    filein: 'Buildables/Profiler.st'; 
    filein: 'Buildables/Application.st'; 
    filein: 'Buildables/XHTMLPage.st'; 

    filein: 'Dispatching/DispatchError.st';
    filein: 'Dispatching/Dispatcher.st'; 
    filein: 'Dispatching/Route.st'; 

    filein: 'RequestHandlers/ResponseNotification.st';
    filein: 'RequestHandlers/RequestHandler.st';
    filein: 'RequestHandlers/ErrorHandler.st';   
    filein: 'RequestHandlers/FileHandler.st'; 
    filein: 'RequestHandlers/NotFoundHandler.st'; 
    filein: 'RequestHandlers/JsonHandler.st'; 
    filein: 'RequestHandlers/ApplicationHandler.st'; 
    filein: 'RequestHandlers/RedirectHandler.st'; 

    buildXml
]
