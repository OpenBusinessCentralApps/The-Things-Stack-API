codeunit 77109 "obc TTS Default Cluster" implements "obc TTS IClusterAddress"
{
    Access = Internal;

    procedure GetAPIEndpoint(): Text;
    begin
        Error(NotImplementedErr);
    end;

    procedure GetOAuthEndpoint(): Text
    begin
        Error(NotImplementedErr);
    end;

    var
        NotImplementedErr: Label 'Not implemented';
}