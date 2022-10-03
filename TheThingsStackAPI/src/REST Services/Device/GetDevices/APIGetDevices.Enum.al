enum 77103 "obc TTS API GetDevices" implements "obc TTS IGetDevices"
{
    Extensible = true;
    DefaultImplementation = "obc TTS IGetDevices" = "obc TTS GetDevicesv3";
    value(0; "v3")
    {
        Caption = 'v3';
        Implementation = "obc TTS IGetDevices" = "obc TTS GetDevicesv3";
    }
}