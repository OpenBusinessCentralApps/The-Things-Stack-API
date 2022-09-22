codeunit 52406 "obc TTS API Storage"
{
    Access = Public;
    Description = 'The Things Stack Storage Integration API. For further documentation visit: https://www.thethingsindustries.com/docs/reference/api/storage_integration/';

    procedure GetStoredApplicationUp(Cluster: Enum "obc TTS Cluster Address"; APIVersion: Enum "obc TTS API GetStoredAppUp"; Parameter: Dictionary of [Enum "obc TTS Param GetStoredAppUp", Text]; var JsonResponse: JsonObject): Boolean
    var
        IGetStoredAppUp: Interface "obc TTS IGetStoredAppUp";
    begin
        IGetStoredAppUp := APIVersion;
        exit(IGetStoredAppUp.GetStoredApplicationUp(Cluster, CopyParameter(Parameter), JsonResponse));
    end;

    procedure GetStoredApplicationUp(Cluster: Enum "obc TTS Cluster Address"; APIVersion: Enum "obc TTS API GetStoredAppUp"; Parameter: Dictionary of [Enum "obc TTS Param GetStoredAppUp", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IGetStoredAppUp: Interface "obc TTS IGetStoredAppUp";
    begin
        IGetStoredAppUp := APIVersion;
        exit(IGetStoredAppUp.GetStoredApplicationUp(Cluster, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "obc TTS Param GetStoredAppUp", Text]) ParameterCopy: Dictionary of [enum "obc TTS Param GetStoredAppUp", Text];
    var
        ParamKeys: List of [Enum "obc TTS Param GetStoredAppUp"];
        GetStoredAppUpParameter: Enum "obc TTS Param GetStoredAppUp";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach GetStoredAppUpParameter in ParamKeys do
            ParameterCopy.Add(GetStoredAppUpParameter, Parameter.Get(GetStoredAppUpParameter));
    end;
}