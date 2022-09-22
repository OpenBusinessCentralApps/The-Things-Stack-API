codeunit 50252 "obc TTS Demo GetApplications"
{
    Access = Internal;
    Description = 'Code sample how to use GetApplications API';

    local procedure GetApplications()
    var
        ApplicationAPI: Codeunit "obc TTS API Application";
        JResponse: JsonObject;
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "obc TTS Cluster Address";
        APIVerion: Enum "obc TTS API GetApplications";
        Param: Dictionary of [Enum "obc TTS Param GetApplications", Text];
        GetApplicationsParam: Enum "obc TTS Param GetApplications";
    begin
        Clear(Param);
        Param.Add(GetApplicationsParam::"AuthToken", '<InsertAuthToken>');

        //Return value JsonObject
        ApplicationAPI.GetApplications(Cluster::eu1, APIVerion::v3, Param, JResponse);

        //Return value HttpResponse
        ApplicationAPI.GetApplications(Cluster::eu1, APIVerion::v3, Param, HttpResponse);
    end;
}