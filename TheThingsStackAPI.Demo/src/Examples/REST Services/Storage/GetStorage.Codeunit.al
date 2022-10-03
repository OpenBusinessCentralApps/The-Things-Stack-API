codeunit 77185 "obc TTS Demo GetStorage"
{
    Access = Internal;
    Description = 'Code sample how to use GetStorage API';
    local procedure GetStorage()
    var
        StorageAPI: Codeunit "obc TTS API Storage";
        JResponse: JsonObject;
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "obc TTS Cluster Address";
        APIVerion: Enum "obc TTS API GetStoredAppUp";
        Param: Dictionary of [Enum "obc TTS Param GetStoredAppUp", Text];
        GetStoredAppUpParam: Enum "obc TTS Param GetStoredAppUp";
    begin
        Clear(Param);
        Param.Add(GetStoredAppUpParam::"AuthToken", '<AuthToken');
        Param.Add(GetStoredAppUpParam::application_ids, '<applicatonId>');
        Param.Add(GetStoredAppUpParam::end_device_ids, '<deviceId>');
        Param.Add(GetStoredAppUpParam::type, '<Type>'); //For a list of Type visit: https://www.thethingsindustries.com/docs/reference/api/storage_integration/

        //Return value JsonObject
        StorageAPI.GetStoredApplicationUp(Cluster::eu1, APIVerion::v3, Param, JResponse);

        //Return value HttpResponse
        StorageAPI.GetStoredApplicationUp(Cluster::eu1, APIVerion::v3, Param, HttpResponse);
    end;
}