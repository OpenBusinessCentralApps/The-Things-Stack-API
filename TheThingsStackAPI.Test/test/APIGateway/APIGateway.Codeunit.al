codeunit 50109 "obc TTS Test API Gateway"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestEu1GetGatewaysWithHttp()
    var
        GatewayAPI: Codeunit "obc TTS API Gateway";
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "obc TTS Cluster Address";
        APIVersion: Enum "obc TTS API GetGateways";
        Param: Dictionary of [Enum "obc TTS Param GetGateways", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetGateways using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetGatewaysParam(Param);

        //[Finally] Verify TTS response  
        Assert.IsTrue(GatewayAPI.GetGateways(Cluster::eu1, APIVersion::Test, Param, HttpResponse), 'TTS Rest API should return true');
    end;

    [Test]
    procedure TestEu1GetGatewaysWithJson()
    var
        GatewayAPI: Codeunit "obc TTS API Gateway";
        JResponse: JsonObject;
        StatusCodeToken: JsonToken;
        MessageToken: JsonToken;

        Cluster: Enum "obc TTS Cluster Address";
        APIVersion: Enum "obc TTS API GetGateways";
        Param: Dictionary of [Enum "obc TTS Param GetGateways", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetGateways using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetGatewaysParam(Param);

        //[Finally] Verify TTS response  
        Assert.IsTrue(GatewayAPI.GetGateways(Cluster::eu1, APIVersion::Test, Param, JResponse), 'TTS Rest API should return true');
    end;

    local procedure CreateGetGatewaysParam(var Param: Dictionary of [Enum "obc TTS Param GetGateways", Text])
    var
        GetGatewaysParam: Enum "obc TTS Param GetGateways";
    begin
        Clear(Param);
        Param.Add(GetGatewaysParam::AuthToken, Any.AlphanumericText(100));
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