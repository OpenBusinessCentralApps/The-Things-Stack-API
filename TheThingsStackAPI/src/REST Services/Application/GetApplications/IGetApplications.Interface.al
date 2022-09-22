interface "obc TTS IGetApplications"
{
    procedure GetApplications(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [Enum "obc TTS Param GetApplications", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    procedure GetApplications(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [Enum "obc TTS Param GetApplications", Text]; var JsonResponse: JsonObject): Boolean;
}