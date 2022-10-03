enumextension 77150 "obc TTS Test GetDevices" extends "obc TTS API GetDevices"
{
    value(50100; "Test")
    {
        Implementation = "obc TTS IGetDevices" = "obc TTS Test GetDevices Test";
    }
}