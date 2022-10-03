codeunit 77112 "obc TTS GetGatewaysv3" implements "obc TTS IGetGateways"
{
    Access = Internal;
    procedure GetGateways(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetGateways", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "obc TTS REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        GetDeviceParamenter: Enum "obc TTS Param GetGateways";
    begin
        UriBuilder.Init(BuildAPIUrl(Cluster));
        UriBuilder.GetUri(Uri);

        if RESTHelper.InvokeWebRequest(Uri.GetAbsoluteUri(), Parameter.Get(GetDeviceParamenter::"AuthToken"), HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure GetGateways(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetGateways", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "obc TTS REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        GetGateways(Cluster, Parameter, HttpResponse);
        exit(RESTHelper.ProcessHttpResponseMessage(HttpResponse, JsonResponse));
    end;

    local procedure BuildAPIUrl(Cluster: Enum "obc TTS Cluster Address"): Text
    var
        ICluster: Interface "obc TTS IClusterAddress";
        ApplicationsHttpBindingLbl: Label '/api/v3/gateways', Locked = true;
    begin
        ICluster := Cluster;
        exit(ICluster.GetAPIEndpoint() + ApplicationsHttpBindingLbl);
    end;

}