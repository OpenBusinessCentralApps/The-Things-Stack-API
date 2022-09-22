codeunit 50107 "obc TTS Test API Application"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestEu1GetApplicationsWithHttp()
    var
        ApplicationAPI: Codeunit "obc TTS API Application";
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "obc TTS Cluster Address";
        APIVersion: Enum "obc TTS API GetApplications";
        Param: Dictionary of [Enum "obc TTS Param GetApplications", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetApplications using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetApplicationsParam(Param);

        //[Then] Verify TTS response  
        Assert.IsTrue(ApplicationAPI.GetApplications(Cluster::eu1, APIVersion::Test, Param, HttpResponse), 'TTS Rest API should return true');
    end;

    [Test]
    procedure TestEu1GetApplicationsWithJson()
    var
        ApplicationAPI: Codeunit "obc TTS API Application";
        JResponse: JsonObject;
        StatusCodeToken: JsonToken;
        MessageToken: JsonToken;

        Cluster: Enum "obc TTS Cluster Address";
        APIVersion: Enum "obc TTS API GetApplications";
        Param: Dictionary of [Enum "obc TTS Param GetApplications", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetApplications using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetApplicationsParam(Param);

        //[Finally] Verify TTS response  
        Assert.IsTrue(ApplicationAPI.GetApplications(Cluster::eu1, APIVersion::Test, Param, JResponse), 'TTS Rest API should return true');
    end;

    local procedure CreateGetApplicationsParam(var Param: Dictionary of [Enum "obc TTS Param GetApplications", Text])
    var
        GetApplicationsParam: Enum "obc TTS Param GetApplications";
    begin
        Clear(Param);
        Param.Add(GetApplicationsParam::AuthToken, Any.AlphanumericText(100));
    end;

    local procedure Inizialize()
    var
        TTSMgt: Codeunit "obc TTS App Mgt.";
    begin
        if IsInitialized then
            exit;

        TTSMgt.EnableWebserviceCallsInSandbox();
        IsInitialized := true;
    end;


    var
        Any: Codeunit Any;
        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        IsInitialized: Boolean;
}