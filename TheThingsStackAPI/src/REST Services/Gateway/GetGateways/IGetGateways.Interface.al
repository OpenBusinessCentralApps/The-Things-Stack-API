interface "obc TTS IGetGateways"
{
    Access = Public;
    procedure GetGateways(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [Enum "obc TTS Param GetGateways", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure GetGateways(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [Enum "obc TTS Param GetGateways", Text]; var JsonResponse: JsonObject): Boolean;
}