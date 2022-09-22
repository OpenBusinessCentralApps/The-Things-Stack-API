enumextension 50102 "obc TTS Test GetApplications" extends "obc TTS API GetApplications"
{
    value(50100; "Test")
    {
        Implementation = "obc TTS IGetApplications" = "obc TTS Test GetAppl. Test";
    }
}