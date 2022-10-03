codeunit 77110 "obc TTS GetApplicationsv3" implements "obc TTS IGetApplications"
{
    Access = Internal;
    procedure GetApplications(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetApplications", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        RESTHelper: Codeunit "obc TTS REST Helper";
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        GetApplicationParamenter: Enum "obc TTS Param GetApplications";
    begin
        UriBuilder.Init(BuildAPIUrl(Cluster));
        UriBuilder.GetUri(Uri);

        if RESTHelper.InvokeWebRequest(Uri.GetAbsoluteUri(), Parameter.Get(GetApplicationParamenter::"AuthToken"), HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure GetApplications(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetApplications", Text]; var JsonResponse: JsonObject): Boolean;
    var
        RESTHelper: Codeunit "obc TTS REST Helper";
        HttpResponse: HttpResponseMessage;
    begin
        GetApplications(Cluster, Parameter, HttpResponse);
        exit(RESTHelper.ProcessHttpResponseMessage(HttpResponse, JsonResponse));
    end;

    local procedure BuildAPIUrl(Cluster: Enum "obc TTS Cluster Address"): Text
    var
        ICluster: Interface "obc TTS IClusterAddress";
        ApplicationsHttpBindingLbl: Label '/api/v3/applications', Locked = true;
    begin
        ICluster := Cluster;
        exit(ICluster.GetAPIEndpoint() + ApplicationsHttpBindingLbl);
    end;

}