permissionset 50250 "obc TTS Demo API"
{
    Access = Public;
    Assignable = true;
    Caption = 'The Things Stack API Demo';
    IncludedPermissionSets = "obc TTS API";
    Permissions =
        tabledata "obc TTS Demo API Key" = RIMD,
        tabledata "obc TTS Demo Application" = RIMD,
        tabledata "obc TTS Demo Device" = RIMD,
        tabledata "obc TTS Demo Gateway" = RIMD,
        tabledata "obc TTS Demo Setup" = RIMD,
        tabledata "obc TTS Demo Storage" = RIMD,
        page "obc TTS Demo Setup Card" = X,
        page "obc TTS Demo API Key Card" = X,
        page "obc TTS Demo API Key List" = X,
        page "obc TTS Demo Application List" = X,
        page "obc TTS Demo Device List" = X,
        page "obc TTS Demo Gateway List" = X,
        page "obc TTS Demo Storage List" = X,
        codeunit "obc TTS Demo Install" = X,
        codeunit "obc TTS Demo Upgrade" = X,
        codeunit "obc TTS Demo GetApplications" = X,
        codeunit "obc TTS Demo GetDevices" = X,
        codeunit "obc TTS Demo GetGateways" = X,
        codeunit "obc TTS Demo GetStorage" = X;
}