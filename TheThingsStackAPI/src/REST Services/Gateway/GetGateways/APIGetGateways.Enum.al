enum 52405 "obc TTS API GetGateways" implements "obc TTS IGetGateways"
{
    Extensible = true;
    Access = Public;
    DefaultImplementation = "obc TTS IGetGateways" = "obc TTS GetGatewaysv3";
    value(0; "v3")
    {
        Caption = 'v3';
        Implementation = "obc TTS IGetGateways" = "obc TTS GetGatewaysv3";
    }
}