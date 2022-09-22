permissionset 52400 "obc TTS API"
{
    Caption = 'The Things Stack API';
    Assignable = false;
    Access = Public;

    Permissions =
        codeunit "obc TTS Install" = X,
        codeunit "obc TTS Upgrade" = X,
        codeunit "obc TTS App Mgt." = X,
        codeunit "obc TTS Default Cluster" = X,
        codeunit "obc TTS eu1 Cluster" = X,
        codeunit "obc TTS API Application" = X,
        codeunit "obc TTS API Gateway" = X,
        codeunit "obc TTS API Device" = X,
        codeunit "obc TTS API Storage" = X,
        codeunit "obc TTS GetApplicationsv3" = X,
        codeunit "obc TTS GetDevicesv3" = X,
        codeunit "obc TTS GetGatewaysv3" = X,
        codeunit "obc TTS GetStoredAppUpv3" = X,
        codeunit "obc TTS REST Helper" = X;
}