enum 77101 "obc TTS API GetApplications" implements "obc TTS IGetApplications"
{
    Extensible = true;
    Access = Public;
    DefaultImplementation = "obc TTS IGetApplications" = "obc TTS GetApplicationsv3";
    value(0; "v3")
    {
        Caption = 'v3';
        Implementation = "obc TTS IGetApplications" = "obc TTS GetApplicationsv3";
    }
}