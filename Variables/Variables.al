<<<<<<< HEAD
codeunit 50101 Variables
{
    procedure TextBuilder()
    var
        myTextBUilder1: TextBuilder;
    begin
        myTextBuilder1.Append('Hello I am ');
        myTextBuilder1.Append(USERID);
        myTextBuilder1.AppendLine(', live @ Modern Dev Bootcamp!');
        myTextBuilder1.Append('This is so awesome :)');
        MESSAGE(myTextBuilder1.ToText());
        myTextBuilder1.Replace('Dev', 'Development');
        MESSAGE(myTextBuilder1.ToText());
    end;

    procedure lista()
    var
        List1: List of [Text];
        i: Integer;
    begin
        Clear(List1);
        //Añadir a lista
        List1.Add('Clie1');
        List1.Add('Clie2');

        //Buscar en lista
        if List1.Contains('Clie1') then
            Message('OK');

        //Borrar un registro
        if List1.Contains(('Clie2')) then
            list1.Remove('Clie2');

        //Borra una posicion de la lista
        if List1.Count() > 10 then begin
            for i := 11 to list1.Count() do begin
                list1.RemoveAt(i);
            end;
        end;

        //Num registros
        message('Registros : ' + format(list1.Count()));
        //hay mas opciones
    end;



    //https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/library

    //BigInteger --> Stores very large whole numbers that range from -9,223,372,036,854,775,807 to 9,223,372,036,854,775,807.
    //BigText --> Handles large text documents.
    //Blob --> Is a complex data type. Variables of this data type differ from normal numeric and string variables in that BLOBs have a variable length. The maximum size of a BLOB(binary large object) is 2 GB.
    //Boolean --> Indicates true or false.
    //Byte --> Stores a single, 8-bit character as a value in the range 0 to 255. You can easily convert this data type from a number to a character and vice versa. This means you can use mathematical operators on Byte variables.
    //Char --> Stores a single, 16-bit character as a value in the range 0 to 65535. You can convert this data type from a number to a character and vice versa. This means you can use mathematical operators on Char variables.
    //Code  --> Denotes a special type of string that is converted to uppercase and removes any trailing or leading spaces.
    //Codeunit  -->Is a container for AL code that you can use from other application objects.
    //CodeunitInstance --> Is a container for AL code that you can use from other application objects.
    //CompanyProperty --> Provides language support for company properties.
    //Database --> Provides access to common database functionality.
    //Date --> Denotes a date ranging from January 1, 1753 to December 31, 9999.
    //DateFormula --> Represents a date formula that has the same capabilities as an ordinary input string for the CALCDATE Method (Date). The DateFormula data type is used to provide multilanguage capabilities to the CALCDATE Method (Date).
    //DateTime --> Denotes a date and time ranging from January 1, 1753, 00:00:00.000 to December 31, 9999, 23:59:59.999. An undefined or blank DateTime is specified by 0DT.
    //Debugger --> Enables communication with a debugger.
    //Decimal --> Denotes decimal numbers ranging from -999,999,999,999,999.99 to +999,999,999,999,999.99.
    //Dialog --> Represents a dialog window.
    //Dictionary --> Represents a collection of keys and values.
    //DotNet --> Represents an unspecified .NET type.
    //Duration --> Represents the difference between two DateTimes. This value can be negative. It is stored as a 64-bit integer. The integer value is the number of milliseconds during the duration.
    //FieldRef --> Identifies a field in a table and gives you access to this field.
    //File --> Represents a file.
    //FilterPageBuilder --> Stores filter configurations for a filter page. A filter page is a dynamic page type that contains one or more filter controls that enables users to set filters on fields of the underlying tables.
    //Guid --> Represents a 16 byte binary data type. This data type is used for the global identification of objects, programs, records, and so on. The important property of a GUID is that each value is globally unique. The value is generated by an algorithm, developed by Microsoft, which assures this uniqueness.
    //HttpClient --> Provides a data type for sending HTTP requests and receiving HTTP responses from a resource identified by a URI.
    //HttpContent --> Represents an HTTP entity body and content headers.
    //HttpHeaders --> Is a collection of headers and their values.
    //HttpRequestMessage --> Represents a HTTP request message.
    //HttpResponseMessage --> Represents a HTTP response message including the status code and data.
    //InStream --> Is a generic stream object that you can use to read from or write to files and BLOB  s. You can define the internal structure of a stream as a flat stream of bytes. You can assign one stream to another. Reading from and writing to a stream occurs sequentially.
    //Integer --> Stores whole numbers with values that range from -2,147,483,647 to 2,147,483,647.
    //JsonArray --> Is a container for any well-formed JSON array. A default JsonArray contains an empty JSON array.
    //JsonObject --> Is a container for any well-formed JSON object. A default JsonObject contains an empty JSON object.
    //JsonToken --> Is a container for any well-formed JSON data. A default JsonToken object contains the JSON value of NULL.
    //jsonValue  --> Is a container for any well-formed fundamental JSON value. A default JsonValue is set to the JSON value of NULL.
    //KeyRef --> Identifies a key in a table and the fields in this key.
    //Label --> Denotes a string constant that can be optionally translated into multiple languages.
    //List --> Represents a strongly typed list of objects that can be accessed by index.
    //Media --> Encapsulates media files, such as image .jpg and .png files, in application database tables. The Media data type can be used as a table field data type, but cannot be used as a variable or parameter. The Media data type enables you to import a media file to the application database and reference the file from records, making it possible to display the media file in the client user interface. You can also export media from the database to files and streams.
    //MediaSet --> Encapsulates media, such as images, in application database tables.
    //ModuleDependencyInfo -->Provides information about a dependent module.
    //ModuleInfo --> Represents information about an application consumable from AL.
    //NavApp -->Provides information about a NavApp.
    //None -->Is used implicitly when a method does not return a value.
    //Notification --> Provides a programmatic way to send non-intrusive information to the user interface (UI) in the Business Central Web client.
    //Option --> Denotes an option value. In the code snippet below, you can see how the Option data type is declared.
    //OutStream --> Is a generic stream object that you can use to write to files and BLOBs.
    //Page --> Contains a number of simpler elements called controls. Controls are used to display information to the user or receive information from the user.
    //Query --> Enables you to retrieve data from multiple tables and combine the data in single dataset.
    //QueryInstance --> Enables you to retrieve data from multiple tables and combine the data in single dataset.
    //RecordId  --> Contains the table number and the primary key of a table.
    //RecordRef --> References a record in a table.
    //Report --> Is used to display, print, or process information from a database.
    //RequestPage --> Is a page that is run before the report starts to execute. Request pages enable end-users to specify options and filters for a report.
    //Session --> Represents a Microsoft Dynamics Business Central session.
    // SessionSettings --> Is a complex data type for passing user personalization settings for a client session as an object. The object contains properties that correspond to the fields in the system table 2000000073 User Personalization, including: App ID, Company, Language ID, Locale ID, Profile ID, Scope, and Time Zone. You can use the AL methods of the SessionSettings data type to get, set, and send the user personalization settings for the current client session.
    //string --> Denotes a sequence of characters. It can be represented by a string literal, a text value or a code value.
    //System --> Is a complex data type.
    //Table --> Is a complex data type.
    //TestAction --> Represents a test action on a page.
    //TestField --> Represents a testable field on a page.
    //TestFilter --> Represents a test filter on a page.
    //TestFilterField --> Represents the type of a field filter in a test filter on a page or on a request page.
    //TestPage --> Represents a variable type that can be used to test Page Application Objects.
    //TestPart --> Represents a variable type that can be used to test Page Application Objects of type Part.
    //TestRequestPage --> Stores test request pages. A test request page part is a logical representation of a request page on a report. A test request page does not display a user interface (UI). The subtype of a test request page is the report whose request page you want to test.
    //Text --> Denotes a text string.
    //TextConst --> Denotes a multi-language string constant.
    //TextBuilder --> Represents a lighweight wrapper for the .Net implementation of StringBuilder.
    //Time --> Denotes a time ranging from 00:00:00.000 to 23:59:59.999. An undefined or blank time is specified by 0T.
    //Variant --> Represents an AL variable object. The AL variant data type can contain many AL data types.
    //Version --> Represents a version matching the format: Major.Minor.Build.Revision .
    //WebServiceActionContext --> Represents an AL WebServiceActionContext.
    //XmlAttribute --> Represents an XML attribute.
    //XmlAttributeCollection --> Represents a collection of XML attributes.
    //XmlCData --> Represents a CData section.
    //XmlComment --> Represents an XML comment.
    //XmlDeclaration --> Represents an XML declaration.
    //XmlDocument --> Represents an XML document.
    //XmlDocumentType --> Represents an XML document type.
    //XmlElement --> Represents an XML element.
    //XmlNamespaceManager --> Represents a namespace manager that can be used to resolve, add and remove namespaces to a collection. It also provides scope management for these namespaces.
    //XmlNameTable  -->  Represents a table of atomized string objects.
    //XmlNode --> Represents a XML node which can either be for instance an XML attribute, an XML element or a XML document.
    //XmlNodeList -->  Represents a collection of XML nodes.
    //Xmlport --> XmlPorts are used to export or import data between an external source and a Microsoft Dynamics Business Central database.
    //XmlportInstance --> Represents an instance of an XmlPort.
    //XmlProcessingInstruction  --> Represents a processing instruction, which XML defines to keep processor-specific information in the text of the document.
    //XmlReadOptions --> Represents the options configuring how XML is loaded from a data source.
    //XmlText --> Represents the text content of an element or attribute.
    //XmlWriteOptions --> Represents the options configuring how XML is saved.
    //Action --> Represents the action that the user took on the page.
    //ClientType --> Represents the type of the client executing the operation.
    //DataClassification --> Sets the classification of the data in the table or field.
    //DataScope --> Identifies the scope of stored data in the isolated storage.
    //DefaultLayout --> The default layout to be used by a report.
    //ExecutionContext --> Represents the context in which a session is running. In certain scenarios, for example during upgrade, the system will run a session in a special context for a limited time.
    //ExecutionMode --> The execution mode of the current session.
    //FieldClass --> Represents the type of a field class.
    //FieldType --> Represents the type of a table field.
    //NotificationScope --> Specifies the context in which the notification appears in the client.
    //ObjectType --> The different types of objects.
    //ReportFormat --> Specifies the format of the report.
    //SecurityFilter --> Specifies how security filters are applied to the record.
    //TableConnectionType --> Use variables of this data type to specify the type of connection to an external database.
    //TestPermissions --> Specifies a value that can be used to determine which permission sets are used on tests that are run by test codunits or test functions.
    //TextEncoding --> Represents a file encoding.
    //TransactionModel --> Represents a test transaction model.
    //TransactionType --> Represents a transaction type.
    //Verbosity --> Represents the security level of events.
    //WebServiceActionResultCode --> Represents a web service action status code.
    trigger OnRun()
    begin


    end;

    var

        VarBigInteger: BigInteger;
        VarBigText: BigText;
        VarBoolean: Boolean;
        VarByte: Byte;
        VarChar: Char;
        VarCode: Code[20];
        VarCodeunit: Codeunit 80;
        VarCodeunit1: Codeunit "Sales-Post + Print";
        vDate: Date;
        vDateFormula: DateFormula;
        VDateTime: DateTime;

        vDecimal: Decimal;
        VDialog: Dialog;
        VDictionary: Dictionary of [char, Integer];
        //DotNet --> Represents an unspecified .NET type.
        VarDuration: Duration;
        VarFieldRef: FieldRef;
        VarFile: File;
        VarFilterPageBuilder: FilterPageBuilder;
        VarGuid: guid;

        VarInStream: InStream;
        VarInteger: Integer;
        VarLabel: Label 'Ejemplo de label';
        VarList: List of [Text];
        VarList1: List of [Text[30]];
        VarList2: List of [Code[20]];
        VarList3: List of [Integer];   //etc      
        VarModuleDependencyInfo: ModuleDependencyInfo;

        VarModuleInfo: ModuleInfo;
        VarNavApp: ModuleInfo;

        VarNotification: Notification;
        VarNotificationScope: NotificationScope;
        VarOption: Option;
        VarOutStream: OutStream;
        VarPage: Page 22;
        VarPage1: Page "Customer Card";
        VarQuery: Query "Cust. Ledg. Entry Remain. Amt.";
        VarRecordRef: RecordRef;
        VarReport: Report 10;
        VarReport1: Report "Customer - List";
        VarSessionSettings: SessionSettings;

        //TestAction --> Represents a test action on a page.
        //TestField --> Represents a testable field on a page.
        //TestFilter --> Represents a test filter on a page.
        //TestFilterField --> Represents the type of a field filter in a test filter on a page or on a request page.
        //TestPage --> Represents a variable type that can be used to test Page Application Objects.
        //TestPart --> Represents a variable type that can be used to test Page Application Objects of type Part.
        //TestRequestPage --> Stores test request pages. A test request page part is a logical representation of a request page on a report. A test request page does not display a user interface (UI). The subtype of a test request page is the report whose request page you want to test.

        VarTextConst: TextConst ENU = 'Text', ESP = 'Texto';
        VarTextBuilder: TextBuilder;
        VarTime: Time;
        VarVariant: Variant;
        VarVersion: Version;
        VarWebServiceActionContext: WebServiceActionContext;

        //XML
        VarXmlAttribute: XmlAttribute;
        VarXmlAttributeCollection: XmlAttributeCollection;
        VarXmlCData: XmlCData;
        VarXmlComment: XmlComment;
        VarXmlDeclaration: XmlDeclaration;
        VarXmlDocument: XmlDocument;
        VarXmlDocumentType: XmlDocumentType;
        VarXmlElement: XmlElement;
        VarXmlNamespaceManager: XmlNamespaceManager;
        VarXmlNameTable: XmlNameTable;
        VarXmlNode: XmlNode;
        VarXmlNodeList: XMlNodeList;
        VarXmlport: XmlPort "CAL Test Results";
        //XmlportInstance --> Represents an instance of an XmlPort.
        VarXmlProcessingInstruction: XmlProcessingInstruction;
        VarXmlReadOptions: XmlReadOptions;
        VarXmlText: XmlText;
        VarXmlWriteOptions: XmlWriteOptions;
        VarAction: Action;
        VarClientType: ClientType;
        VarDataClassification: DataClassification;
        VarDataScope: DataScope;
        VarDefaultLayout: DefaultLayout;
        VarExecutionContext: ExecutionContext;
        VarExecutionMode: ExecutionMode;
        VarFieldType: FieldType;

        VarObjectType: ObjectType;
        VarReportFormat: ReportFormat;
        VarSecurityFilter: SecurityFilter;
        VarTableConnectionType: TableConnectionType;
        VarTestPermissions: TestPermissions;
        VarTextEncoding: TextEncoding;
        VarTransactionModel: TransactionModel;
        VarTransactionType: TransactionType;
        VarVerbosity: Verbosity;
        VarWebServiceActionResultCode: WebServiceActionResultCode;
=======
codeunit 50101 Variables
{
    procedure TextBuilder()
    var
        myTextBUilder1: TextBuilder;
    begin
        myTextBuilder1.Append('Hello I am ');
        myTextBuilder1.Append(USERID);
        myTextBuilder1.AppendLine(', live @ Modern Dev Bootcamp!');
        myTextBuilder1.Append('This is so awesome :)');
        MESSAGE(myTextBuilder1.ToText());
        myTextBuilder1.Replace('Dev', 'Development');
        MESSAGE(myTextBuilder1.ToText());
    end;

    procedure lista()
    var
        List1: List of [Text];
        i: Integer;
    begin
        Clear(List1);
        //Añadir a lista
        List1.Add('Clie1');
        List1.Add('Clie2');

        //Buscar en lista
        if List1.Contains('Clie1') then
            Message('OK');

        //Borrar un registro
        if List1.Contains(('Clie2')) then
            list1.Remove('Clie2');

        //Borra una posicion de la lista
        if List1.Count() > 10 then begin
            for i := 11 to list1.Count() do begin
                list1.RemoveAt(i);
            end;
        end;

        //Num registros
        message('Registros : ' + format(list1.Count()));
        //hay mas opciones
    end;



    //https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/library

    //BigInteger --> Stores very large whole numbers that range from -9,223,372,036,854,775,807 to 9,223,372,036,854,775,807.
    //BigText --> Handles large text documents.
    //Blob --> Is a complex data type. Variables of this data type differ from normal numeric and string variables in that BLOBs have a variable length. The maximum size of a BLOB(binary large object) is 2 GB.
    //Boolean --> Indicates true or false.
    //Byte --> Stores a single, 8-bit character as a value in the range 0 to 255. You can easily convert this data type from a number to a character and vice versa. This means you can use mathematical operators on Byte variables.
    //Char --> Stores a single, 16-bit character as a value in the range 0 to 65535. You can convert this data type from a number to a character and vice versa. This means you can use mathematical operators on Char variables.
    //Code  --> Denotes a special type of string that is converted to uppercase and removes any trailing or leading spaces.
    //Codeunit  -->Is a container for AL code that you can use from other application objects.
    //CodeunitInstance --> Is a container for AL code that you can use from other application objects.
    //CompanyProperty --> Provides language support for company properties.
    //Database --> Provides access to common database functionality.
    //Date --> Denotes a date ranging from January 1, 1753 to December 31, 9999.
    //DateFormula --> Represents a date formula that has the same capabilities as an ordinary input string for the CALCDATE Method (Date). The DateFormula data type is used to provide multilanguage capabilities to the CALCDATE Method (Date).
    //DateTime --> Denotes a date and time ranging from January 1, 1753, 00:00:00.000 to December 31, 9999, 23:59:59.999. An undefined or blank DateTime is specified by 0DT.
    //Debugger --> Enables communication with a debugger.
    //Decimal --> Denotes decimal numbers ranging from -999,999,999,999,999.99 to +999,999,999,999,999.99.
    //Dialog --> Represents a dialog window.
    //Dictionary --> Represents a collection of keys and values.
    //DotNet --> Represents an unspecified .NET type.
    //Duration --> Represents the difference between two DateTimes. This value can be negative. It is stored as a 64-bit integer. The integer value is the number of milliseconds during the duration.
    //FieldRef --> Identifies a field in a table and gives you access to this field.
    //File --> Represents a file.
    //FilterPageBuilder --> Stores filter configurations for a filter page. A filter page is a dynamic page type that contains one or more filter controls that enables users to set filters on fields of the underlying tables.
    //Guid --> Represents a 16 byte binary data type. This data type is used for the global identification of objects, programs, records, and so on. The important property of a GUID is that each value is globally unique. The value is generated by an algorithm, developed by Microsoft, which assures this uniqueness.
    //HttpClient --> Provides a data type for sending HTTP requests and receiving HTTP responses from a resource identified by a URI.
    //HttpContent --> Represents an HTTP entity body and content headers.
    //HttpHeaders --> Is a collection of headers and their values.
    //HttpRequestMessage --> Represents a HTTP request message.
    //HttpResponseMessage --> Represents a HTTP response message including the status code and data.
    //InStream --> Is a generic stream object that you can use to read from or write to files and BLOB  s. You can define the internal structure of a stream as a flat stream of bytes. You can assign one stream to another. Reading from and writing to a stream occurs sequentially.
    //Integer --> Stores whole numbers with values that range from -2,147,483,647 to 2,147,483,647.
    //JsonArray --> Is a container for any well-formed JSON array. A default JsonArray contains an empty JSON array.
    //JsonObject --> Is a container for any well-formed JSON object. A default JsonObject contains an empty JSON object.
    //JsonToken --> Is a container for any well-formed JSON data. A default JsonToken object contains the JSON value of NULL.
    //jsonValue  --> Is a container for any well-formed fundamental JSON value. A default JsonValue is set to the JSON value of NULL.
    //KeyRef --> Identifies a key in a table and the fields in this key.
    //Label --> Denotes a string constant that can be optionally translated into multiple languages.
    //List --> Represents a strongly typed list of objects that can be accessed by index.
    //Media --> Encapsulates media files, such as image .jpg and .png files, in application database tables. The Media data type can be used as a table field data type, but cannot be used as a variable or parameter. The Media data type enables you to import a media file to the application database and reference the file from records, making it possible to display the media file in the client user interface. You can also export media from the database to files and streams.
    //MediaSet --> Encapsulates media, such as images, in application database tables.
    //ModuleDependencyInfo -->Provides information about a dependent module.
    //ModuleInfo --> Represents information about an application consumable from AL.
    //NavApp -->Provides information about a NavApp.
    //None -->Is used implicitly when a method does not return a value.
    //Notification --> Provides a programmatic way to send non-intrusive information to the user interface (UI) in the Business Central Web client.
    //Option --> Denotes an option value. In the code snippet below, you can see how the Option data type is declared.
    //OutStream --> Is a generic stream object that you can use to write to files and BLOBs.
    //Page --> Contains a number of simpler elements called controls. Controls are used to display information to the user or receive information from the user.
    //Query --> Enables you to retrieve data from multiple tables and combine the data in single dataset.
    //QueryInstance --> Enables you to retrieve data from multiple tables and combine the data in single dataset.
    //RecordId  --> Contains the table number and the primary key of a table.
    //RecordRef --> References a record in a table.
    //Report --> Is used to display, print, or process information from a database.
    //RequestPage --> Is a page that is run before the report starts to execute. Request pages enable end-users to specify options and filters for a report.
    //Session --> Represents a Microsoft Dynamics Business Central session.
    // SessionSettings --> Is a complex data type for passing user personalization settings for a client session as an object. The object contains properties that correspond to the fields in the system table 2000000073 User Personalization, including: App ID, Company, Language ID, Locale ID, Profile ID, Scope, and Time Zone. You can use the AL methods of the SessionSettings data type to get, set, and send the user personalization settings for the current client session.
    //string --> Denotes a sequence of characters. It can be represented by a string literal, a text value or a code value.
    //System --> Is a complex data type.
    //Table --> Is a complex data type.
    //TestAction --> Represents a test action on a page.
    //TestField --> Represents a testable field on a page.
    //TestFilter --> Represents a test filter on a page.
    //TestFilterField --> Represents the type of a field filter in a test filter on a page or on a request page.
    //TestPage --> Represents a variable type that can be used to test Page Application Objects.
    //TestPart --> Represents a variable type that can be used to test Page Application Objects of type Part.
    //TestRequestPage --> Stores test request pages. A test request page part is a logical representation of a request page on a report. A test request page does not display a user interface (UI). The subtype of a test request page is the report whose request page you want to test.
    //Text --> Denotes a text string.
    //TextConst --> Denotes a multi-language string constant.
    //TextBuilder --> Represents a lighweight wrapper for the .Net implementation of StringBuilder.
    //Time --> Denotes a time ranging from 00:00:00.000 to 23:59:59.999. An undefined or blank time is specified by 0T.
    //Variant --> Represents an AL variable object. The AL variant data type can contain many AL data types.
    //Version --> Represents a version matching the format: Major.Minor.Build.Revision .
    //WebServiceActionContext --> Represents an AL WebServiceActionContext.
    //XmlAttribute --> Represents an XML attribute.
    //XmlAttributeCollection --> Represents a collection of XML attributes.
    //XmlCData --> Represents a CData section.
    //XmlComment --> Represents an XML comment.
    //XmlDeclaration --> Represents an XML declaration.
    //XmlDocument --> Represents an XML document.
    //XmlDocumentType --> Represents an XML document type.
    //XmlElement --> Represents an XML element.
    //XmlNamespaceManager --> Represents a namespace manager that can be used to resolve, add and remove namespaces to a collection. It also provides scope management for these namespaces.
    //XmlNameTable  -->  Represents a table of atomized string objects.
    //XmlNode --> Represents a XML node which can either be for instance an XML attribute, an XML element or a XML document.
    //XmlNodeList -->  Represents a collection of XML nodes.
    //Xmlport --> XmlPorts are used to export or import data between an external source and a Microsoft Dynamics Business Central database.
    //XmlportInstance --> Represents an instance of an XmlPort.
    //XmlProcessingInstruction  --> Represents a processing instruction, which XML defines to keep processor-specific information in the text of the document.
    //XmlReadOptions --> Represents the options configuring how XML is loaded from a data source.
    //XmlText --> Represents the text content of an element or attribute.
    //XmlWriteOptions --> Represents the options configuring how XML is saved.
    //Action --> Represents the action that the user took on the page.
    //ClientType --> Represents the type of the client executing the operation.
    //DataClassification --> Sets the classification of the data in the table or field.
    //DataScope --> Identifies the scope of stored data in the isolated storage.
    //DefaultLayout --> The default layout to be used by a report.
    //ExecutionContext --> Represents the context in which a session is running. In certain scenarios, for example during upgrade, the system will run a session in a special context for a limited time.
    //ExecutionMode --> The execution mode of the current session.
    //FieldClass --> Represents the type of a field class.
    //FieldType --> Represents the type of a table field.
    //NotificationScope --> Specifies the context in which the notification appears in the client.
    //ObjectType --> The different types of objects.
    //ReportFormat --> Specifies the format of the report.
    //SecurityFilter --> Specifies how security filters are applied to the record.
    //TableConnectionType --> Use variables of this data type to specify the type of connection to an external database.
    //TestPermissions --> Specifies a value that can be used to determine which permission sets are used on tests that are run by test codunits or test functions.
    //TextEncoding --> Represents a file encoding.
    //TransactionModel --> Represents a test transaction model.
    //TransactionType --> Represents a transaction type.
    //Verbosity --> Represents the security level of events.
    //WebServiceActionResultCode --> Represents a web service action status code.
    trigger OnRun()
    begin


    end;

    var

        VarBigInteger: BigInteger;
        VarBigText: BigText;
        VarBoolean: Boolean;
        VarByte: Byte;
        VarChar: Char;
        VarCode: Code[20];
        VarCodeunit: Codeunit 80;
        VarCodeunit1: Codeunit "Sales-Post + Print";
        vDate: Date;
        vDateFormula: DateFormula;
        VDateTime: DateTime;

        vDecimal: Decimal;
        VDialog: Dialog;
        VDictionary: Dictionary of [char, Integer];
        //DotNet --> Represents an unspecified .NET type.
        VarDuration: Duration;
        VarFieldRef: FieldRef;
        VarFile: File;
        VarFilterPageBuilder: FilterPageBuilder;
        VarGuid: guid;

        VarInStream: InStream;
        VarInteger: Integer;
        VarLabel: Label 'Ejemplo de label';
        VarList: List of [Text];
        VarList1: List of [Text[30]];
        VarList2: List of [Code[20]];
        VarList3: List of [Integer];   //etc      
        VarModuleDependencyInfo: ModuleDependencyInfo;

        VarModuleInfo: ModuleInfo;
        VarNavApp: ModuleInfo;

        VarNotification: Notification;
        VarNotificationScope: NotificationScope;
        VarOption: Option;
        VarOutStream: OutStream;
        VarPage: Page 22;
        VarPage1: Page "Customer Card";
        VarQuery: Query "Cust. Ledg. Entry Remain. Amt.";
        VarRecordRef: RecordRef;
        VarReport: Report 10;
        VarReport1: Report "Customer - List";
        VarSessionSettings: SessionSettings;

        //TestAction --> Represents a test action on a page.
        //TestField --> Represents a testable field on a page.
        //TestFilter --> Represents a test filter on a page.
        //TestFilterField --> Represents the type of a field filter in a test filter on a page or on a request page.
        //TestPage --> Represents a variable type that can be used to test Page Application Objects.
        //TestPart --> Represents a variable type that can be used to test Page Application Objects of type Part.
        //TestRequestPage --> Stores test request pages. A test request page part is a logical representation of a request page on a report. A test request page does not display a user interface (UI). The subtype of a test request page is the report whose request page you want to test.

        VarTextConst: TextConst ENU = 'Text', ESP = 'Texto';
        VarTextBuilder: TextBuilder;
        VarTime: Time;
        VarVariant: Variant;
        VarVersion: Version;
        VarWebServiceActionContext: WebServiceActionContext;

        //XML
        VarXmlAttribute: XmlAttribute;
        VarXmlAttributeCollection: XmlAttributeCollection;
        VarXmlCData: XmlCData;
        VarXmlComment: XmlComment;
        VarXmlDeclaration: XmlDeclaration;
        VarXmlDocument: XmlDocument;
        VarXmlDocumentType: XmlDocumentType;
        VarXmlElement: XmlElement;
        VarXmlNamespaceManager: XmlNamespaceManager;
        VarXmlNameTable: XmlNameTable;
        VarXmlNode: XmlNode;
        VarXmlNodeList: XMlNodeList;
        VarXmlport: XmlPort "CAL Test Results";
        //XmlportInstance --> Represents an instance of an XmlPort.
        VarXmlProcessingInstruction: XmlProcessingInstruction;
        VarXmlReadOptions: XmlReadOptions;
        VarXmlText: XmlText;
        VarXmlWriteOptions: XmlWriteOptions;
        VarAction: Action;
        VarClientType: ClientType;
        VarDataClassification: DataClassification;
        VarDataScope: DataScope;
        VarDefaultLayout: DefaultLayout;
        VarExecutionContext: ExecutionContext;
        VarExecutionMode: ExecutionMode;
        VarFieldType: FieldType;

        VarObjectType: ObjectType;
        VarReportFormat: ReportFormat;
        VarSecurityFilter: SecurityFilter;
        VarTableConnectionType: TableConnectionType;
        VarTestPermissions: TestPermissions;
        VarTextEncoding: TextEncoding;
        VarTransactionModel: TransactionModel;
        VarTransactionType: TransactionType;
        VarVerbosity: Verbosity;
        VarWebServiceActionResultCode: WebServiceActionResultCode;
>>>>>>> 7ebc8907635d9d20980cdd61fd91b3032026485d
}