interface "obc TTS IGetStoredAppUp"
{
    Access = Public;
    procedure GetStoredApplicationUp(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [Enum "obc TTS Param GetStoredAppUp", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure GetStoredApplicationUp(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [Enum "obc TTS Param GetStoredAppUp", Text]; var JsonResponse: JsonObject): Boolean;
}