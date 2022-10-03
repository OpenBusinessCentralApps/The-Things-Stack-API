enumextension 77151 "obc TTS Test GetGateways" extends "obc TTS API GetGateways"
{
    value(50100; "Test")
    {
        Implementation = "obc TTS IGetGateways" = "obc TTS Test GetGateways Test";
    }
}