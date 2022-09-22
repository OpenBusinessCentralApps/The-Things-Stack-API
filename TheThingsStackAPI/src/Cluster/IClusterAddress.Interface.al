interface "obc TTS IClusterAddress"
{
    Access = Public;
    procedure GetAPIEndpoint(): Text;
    procedure GetOAuthEndpoint(): Text;
}