codeunit 77157 "obc TTS Test API Device"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestEu1GetDevicesWithHttp()
    var
        DeviceAPI: Codeunit "obc TTS API Device";
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "obc TTS Cluster Address";
        APIVersion: Enum "obc TTS API GetDevices";
        Param: Dictionary of [Enum "obc TTS Param GetDevices", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetDevices using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetDevicesParam(Param);

        //[Finally] Verify TTS response  
        Assert.IsTrue(DeviceAPI.GetDevices(Cluster::eu1, APIVersion::Test, Param, HttpResponse), 'TTS Rest API should return true');
    end;

    [Test]
    procedure TestEu1GetDevicesWithJson()
    var
        DeviceAPI: Codeunit "obc TTS API Device";
        JResponse: JsonObject;
        StatusCodeToken: JsonToken;
        MessageToken: JsonToken;

        Cluster: Enum "obc TTS Cluster Address";
        APIVersion: Enum "obc TTS API GetDevices";
        Param: Dictionary of [Enum "obc TTS Param GetDevices", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetDevices using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetDevicesParam(Param);

        //[Finally] Verify TTS response  
        Assert.IsTrue(DeviceAPI.GetDevices(Cluster::eu1, APIVersion::Test, Param, JResponse), 'TTS Rest API should return true');
    end;

    local procedure CreateGetDevicesParam(var Param: Dictionary of [Enum "obc TTS Param GetDevices", Text])
    var
        GetDevicesParam: Enum "obc TTS Param GetDevices";
    begin
        Clear(Param);
        Param.Add(GetDevicesParam::AuthToken, Any.AlphanumericText(100));
        Param.Add(GetDevicesParam::ApplicationID, Any.AlphanumericText(100));
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