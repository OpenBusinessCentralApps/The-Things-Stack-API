interface "obc TTS IGetDevices"
{
    Access = Public;
    procedure GetDevices(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [Enum "obc TTS Param GetDevices", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure GetDevices(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [Enum "obc TTS Param GetDevices", Text]; var JsonResponse: JsonObject): Boolean;
}