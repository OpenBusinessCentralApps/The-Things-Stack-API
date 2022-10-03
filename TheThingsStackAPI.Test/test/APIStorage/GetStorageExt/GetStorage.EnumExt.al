enumextension 77152 "obc TTS Test GetStorage" extends "obc TTS API GetStoredAppUp"
{
    value(50100; "Test")
    {
        Implementation = "obc TTS IGetStoredAppUp" = "obc TTS Test Storage Test";
    }
}