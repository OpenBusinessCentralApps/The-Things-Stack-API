codeunit 77107 "obc TTS eu1 Cluster" implements "obc TTS IClusterAddress"
{
    Access = Internal;
    Description = 'For further documentation visit: https://www.thethingsindustries.com/docs/getting-started/ttn/addresses/';

    procedure GetAPIEndpoint(): Text;
    var
        lAPIEndpointTxt: Label 'https://eu1.cloud.thethings.network', Locked = true;
    begin
        exit(lAPIEndpointTxt);
    end;

    procedure GetOAuthEndpoint(): Text
    var
        lOAuthEndpointTxt: Label 'https://eu1.cloud.thethings.network/oauth', Locked = true;
    begin
        exit(lOAuthEndpointTxt);
    end;

}