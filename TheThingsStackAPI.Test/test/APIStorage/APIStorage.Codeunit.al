codeunit 50106 "obc TTS Test API Storage"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestEu1GetStorageWithHttp()
    var
        StorageAPI: Codeunit "obc TTS API Storage";
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "obc TTS Cluster Address";
        APIVersion: Enum "obc TTS API GetStoredAppUp";
        Param: Dictionary of [Enum "obc TTS Param GetStoredAppUp", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetStorage using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetStorageParam(Param);

        //[Finally] Verify TTS response  
        Assert.IsTrue(StorageAPI.GetStoredApplicationUp(Cluster::eu1, APIVersion::Test, Param, HttpResponse), 'TTS Rest API should return true');
    end;

    [Test]
    procedure TestEu1GetStorageWithJson()
    var
        StorageAPI: Codeunit "obc TTS API Storage";
        JResponse: JsonObject;
        ErrorToken: JsonToken;
        StatusCodeToken: JsonToken;
        MessageToken: JsonToken;


        Cluster: Enum "obc TTS Cluster Address";
        APIVersion: Enum "obc TTS API GetStoredAppUp";
        Param: Dictionary of [Enum "obc TTS Param GetStoredAppUp", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetStorage using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetStorageParam(Param);

        //[Finally] Verify TTS response  
        Assert.IsTrue(StorageAPI.GetStoredApplicationUp(Cluster::eu1, APIVersion::Test, Param, JResponse), 'TTS Rest API should return true');


    end;

    local procedure CreateGetStorageParam(var Param: Dictionary of [Enum "obc TTS Param GetStoredAppUp", Text])
    var
        GetStorageParam: Enum "obc TTS Param GetStoredAppUp";
    begin
        Clear(Param);
        Param.Add(GetStorageParam::AuthToken, Any.AlphanumericText(100));
        Param.Add(GetStorageParam::application_ids, Any.AlphanumericText(100));
        Param.Add(GetStorageParam::end_device_ids, Any.AlphanumericText(100));
        Param.Add(GetStorageParam::type, 'uplink_message');
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