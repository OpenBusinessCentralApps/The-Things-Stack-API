enum 77100 "obc TTS Cluster Address" implements "obc TTS IClusterAddress"
{
    Access = Public;
    Extensible = true;
    DefaultImplementation = "obc TTS IClusterAddress" = "obc TTS Default Cluster";

    value(0; "eu1")
    {
        Caption = 'Europe 1 (Ireland)';
        Implementation = "obc TTS IClusterAddress" = "obc TTS eu1 Cluster";
    }
}