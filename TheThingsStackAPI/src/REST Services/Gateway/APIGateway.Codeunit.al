codeunit 52401 "obc TTS API Gateway"
{
    Access = Public;
    Description = 'The Things Stack Gateway API. For further documentation visit: https://www.thethingsindustries.com/docs/reference/api/gateway/';

    procedure GetGateways(Cluster: Enum "obc TTS Cluster Address"; APIVersion: Enum "obc TTS API GetGateways"; Parameter: Dictionary of [Enum "obc TTS Param GetGateways", Text]; var JsonResponse: JsonObject): Boolean
    var
        IGetGateways: Interface "obc TTS IGetGateways";
    begin
        IGetGateways := APIVersion;
        exit(IGetGateways.GetGateways(Cluster, CopyParameter(Parameter), JsonResponse));
    end;

    procedure GetGateways(Cluster: Enum "obc TTS Cluster Address"; APIVersion: Enum "obc TTS API GetGateways"; Parameter: Dictionary of [Enum "obc TTS Param GetGateways", Text]; var HttpResponse: HttpResponseMessage): Boolean
    var
        IGetGateways: Interface "obc TTS IGetGateways";
    begin
        IGetGateways := APIVersion;
        exit(IGetGateways.GetGateways(Cluster, CopyParameter(Parameter), HttpResponse));
    end;

    local procedure CopyParameter(Parameter: Dictionary of [Enum "obc TTS Param GetGateways", Text]) ParameterCopy: Dictionary of [enum "obc TTS Param GetGateways", Text];
    var
        ParamKeys: List of [Enum "obc TTS Param GetGateways"];
        GetGatewaysParameter: Enum "obc TTS Param GetGateways";
    begin
        Clear(ParameterCopy);
        ParamKeys := Parameter.Keys;
        foreach GetGatewaysParameter in ParamKeys do
            ParameterCopy.Add(GetGatewaysParameter, Parameter.Get(GetGatewaysParameter));
    end;
}