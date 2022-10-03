permissionset 77149 "obc TTS Test API"
{
    Caption = 'The Things Stack API Test';
    Assignable = true;
    Access = Public;
    IncludedPermissionSets = "obc TTS API";
    Permissions =
        codeunit "obc TTS Test Install" = X,
        codeunit "obc TTS Test Upgrade" = X,
        codeunit "obc TTS Test API Gateway" = X,
        codeunit "obc TTS Test API Application" = X,
        codeunit "obc TTS Test API Device" = X,
        codeunit "obc TTS Test API Storage" = X;
}