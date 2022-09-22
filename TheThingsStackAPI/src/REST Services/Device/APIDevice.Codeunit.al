codeunit 52405 "obc TTS API Device"
{
    Access = Public;
    Description = 'The Things Stack Device API. For further documentation vistis: https://www.thethingsindustries.com/docs/reference/api/end_device/';

    procedure GetDevices(Cluster: Enum "obc TTS Cluster Address"; APIVersion: Enum "obc TTS API GetDevices"; Parameter: Dictionary of [Enum "obc TTS Param GetDevices", Text]; var JsonResponse: JsonObject): Boolean
    var
        IGetDevices: Interface "obc TTS IGetDevices";
    begin
        IGetDevices := APIVersion;
        exit(IGetDevices.GetDevices(Cluster, CopyParameter(Parameter), JsonResponse));
    end;

    procedure GetDevices(Cluster: Enum "obc TTS Cluster Address"; APIVersion: Enum "obc TTS API GetDevices"; Parameter: Dictionary of [Enum "obc TTS Param GetDevices", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IGetDevices: Interface "obc TTS IGetDevices";
    begin
        IGetDevices := APIVersion;
        exit(IGetDevices.GetDevices(Cluster, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "obc TTS Param GetDevices", Text]) ParameterCopy: Dictionary of [enum "obc TTS Param GetDevices", Text];
    var
        ParamKeys: List of [Enum "obc TTS Param GetDevices"];
        GetDevicesParameter: Enum "obc TTS Param GetDevices";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach GetDevicesParameter in ParamKeys do
            ParameterCopy.Add(GetDevicesParameter, Parameter.Get(GetDevicesParameter));
    end;
}