codeunit 77184 "obc TTS Demo GetGateways"
{
    Access = Internal;
    Description = 'Code sample how to use GetGateways API';
    local procedure GetDevices()
    var
        GatewayAPI: Codeunit "obc TTS API Gateway";
        JResponse: JsonObject;
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "obc TTS Cluster Address";
        APIVerion: Enum "obc TTS API GetGateways";
        Param: Dictionary of [Enum "obc TTS Param GetGateways", Text];
        GetDevicesParam: Enum "obc TTS Param GetGateways";
    begin
        Clear(Param);
        Param.Add(GetDevicesParam::"AuthToken", '<Insert AuthToken>');

        //Return value JsonObject
        GatewayAPI.GetGateways(Cluster::eu1, APIVerion::v3, Param, JResponse);
        GatewayAPI.GetGateways(Cluster::eu1, APIVerion::v3, Param, HttpResponse);
    end;
}