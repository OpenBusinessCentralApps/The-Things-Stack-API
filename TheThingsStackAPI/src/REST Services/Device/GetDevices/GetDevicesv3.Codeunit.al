codeunit 52411 "obc TTS GetDevicesv3" implements "obc TTS IGetDevices"
{
    Access = Internal;
    procedure GetDevices(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetDevices", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "obc TTS REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        GetDeviceParamenter: Enum "obc TTS Param GetDevices";
    begin
        UriBuilder.Init(BuildAPIUrl(Cluster, Parameter.Get(GetDeviceParamenter::ApplicationID)));
        UriBuilder.GetUri(Uri);

        if RESTHelper.InvokeWebRequest(Uri.GetAbsoluteUri(), Parameter.Get(GetDeviceParamenter::"AuthToken"), HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure GetDevices(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetDevices", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "obc TTS REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        GetDevices(Cluster, Parameter, HttpResponse);
        exit(RESTHelper.ProcessHttpResponseMessage(HttpResponse, JsonResponse));
    end;

    local procedure BuildAPIUrl(Cluster: Enum "obc TTS Cluster Address"; ApplicationId: Text): Text
    var
        ICluster: Interface "obc TTS IClusterAddress";
        ApplicationsHttpBindingLbl: Label '/api/v3/applications/%1/devices', Locked = true;
    begin
        ICluster := Cluster;
        exit(StrSubstNo(ICluster.GetAPIEndpoint() + ApplicationsHttpBindingLbl, ApplicationId));
    end;

}