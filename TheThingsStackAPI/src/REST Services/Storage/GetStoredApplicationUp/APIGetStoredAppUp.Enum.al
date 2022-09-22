enum 52407 "obc TTS API GetStoredAppUp" implements "obc TTS IGetStoredAppUp"
{
    Extensible = true;
    Access = Public;
    DefaultImplementation = "obc TTS IGetStoredAppUp" = "obc TTS GetStoredAppUpv3";
    value(0; "v3")
    {
        Caption = 'v3';
        Implementation = "obc TTS IGetStoredAppUp" = "obc TTS GetStoredAppUpv3";
    }
}