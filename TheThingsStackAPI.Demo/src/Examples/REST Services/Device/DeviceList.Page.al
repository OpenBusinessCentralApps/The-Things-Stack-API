page 77185 "obc TTS Demo Device List"
{

    ApplicationArea = All;
    Caption = 'TTS Demo Devices';
    PageType = List;
    SourceTable = "obc TTS Demo Device";
    UsageCategory = Lists;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            group(Settings)
            {
                field(Cluster; Cluster)
                {
                    Caption = 'Cluster';
                    ApplicationArea = all;
                }
                field(APIVersion; APIVersion)
                {
                    Caption = 'API Version';
                    ApplicationArea = all;
                }
                field(ApplicationId; ApplicationId)
                {
                    Caption = 'ApplicationId';
                    ApplicationArea = all;
                }
            }
            repeater(General)
            {
                Caption = 'Devices';
                field(device_id; Rec.device_id)
                {
                    ApplicationArea = All;
                }
                field(application_id; Rec.application_id)
                {
                    ApplicationArea = all;
                }
                field(dev_eui; Rec.dev_eui)
                {
                    ApplicationArea = all;
                }
                field(join_eui; Rec.join_eui)
                {
                    ApplicationArea = all;
                }
                field(created_at; Rec.created_at)
                {
                    ApplicationArea = All;
                }
                field(updated_at; Rec.updated_at)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetDevices)
            {
                Caption = 'Load Devices';
                ApplicationArea = All;
                Image = Refresh;

                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Scope = Page;

                trigger OnAction()
                var
                    DeviceAPI: Codeunit "obc TTS API Device";
                    JResponse: JsonObject;
                    Param: Dictionary of [Enum "obc TTS Param GetDevices", Text];
                    GetDevicesParam: Enum "obc TTS Param GetDevices";
                begin
                    Param.Add(GetDevicesParam::AuthToken, GetDefaultAPIKey());
                    Param.Add(GetDevicesParam::ApplicationID, ApplicationId);
                    if DeviceAPI.GetDevices(Cluster, APIVersion, Param, JResponse) then
                        ProcessJsonRespone(JResponse);
                end;
            }

            action(ShowStorage)
            {
                Caption = 'Show Storage';
                ApplicationArea = All;

                PromotedCategory = Process;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Scope = "Repeater";

                Image = ShowChart;

                trigger OnAction()
                var
                    TTSStorageList: Page "obc TTS Demo Storage List";
                begin
                    TTSStorageList.SetApplicationId(Rec.application_id);
                    TTSStorageList.SetDeviceId(Rec.device_id);
                    TTSStorageList.Run();
                end;
            }
        }
    }

    local procedure ProcessJsonRespone(JObject: JsonObject)
    var
        JDevicesToken: JsonToken;
        JDeviceToken: JsonToken;
        JDeviceObject: JsonObject;

        JIdsToken: JsonToken;
        JApplicationIdsToken: JsonToken;
        JIdToken: JsonToken;
        JCreatedatToken: JsonToken;
        JUpdatedatToken: JsonToken;
        JapplicationIdToken: JsonToken;
        JdeveuiToken: JsonToken;
        JjoineuiToken: JsonToken;

        deviceId: Text[50];
        applicationId: Text[50];
        deveui: Text[50];
        joineui: Text[50];
        createdat: DateTime;
        updatedat: DateTime;
    begin
        Rec.DeleteAll(false);

        JObject.Get('end_devices', JDevicesToken);

        foreach JDeviceToken in JDevicesToken.AsArray() do begin
            JDeviceObject := JDeviceToken.AsObject();

            if JDeviceObject.Get('created_at', JCreatedatToken) then
                createdat := JCreatedatToken.AsValue().AsDateTime();

            if JDeviceObject.Get('updated_at', JUpdatedatToken) then
                updatedat := JUpdatedatToken.AsValue().AsDateTime();

            if JDeviceObject.Get('ids', JIdsToken) then begin
                if JIdsToken.AsObject().Get('device_id', JIdToken) then
                    deviceId := JIdToken.AsValue().AsText();

                if JIdsToken.AsObject().Get('dev_eui', JdeveuiToken) then
                    deveui := JdeveuiToken.AsValue().AsText();

                if JIdsToken.AsObject().Get('join_eui', JjoineuiToken) then
                    joineui := JjoineuiToken.AsValue().AsText();

                if JIdsToken.AsObject().Get('application_ids', JApplicationIdsToken) then
                    if JApplicationIdsToken.AsObject().Get('application_id', JapplicationIdToken) then
                        applicationId := JapplicationIdToken.AsValue().AsText();
            end;



            CreateDevice(deviceId, applicationId, deveui, joineui, createdat, updatedat);
        end;
    end;

    local procedure CreateDevice(deviceId: Text[50]; applicationId: Text[50]; deveui: Text[50]; joineui: Text[50]; createdat: DateTime; updatedat: DateTime)
    begin
        Rec.Init();
        Rec.device_id := deviceId;
        Rec.application_id := applicationId;
        Rec.dev_eui := deveui;
        Rec.join_eui := joineui;
        Rec.created_at := createdat;
        Rec.updated_at := updatedat;
        Rec.Insert();
    end;

    local procedure GetDefaultAPIKey(): Text
    var
        TTSSDKDemoSetup: Record "obc TTS Demo Setup";
    begin
        if TTSSDKDemoSetup.Get() then
            exit(TTSSDKDemoSetup.GetDefaultAPIKey());
    end;

    procedure SetApplicationId(_applicationId: Text)
    begin
        ApplicationId := _applicationId;
    end;

    var

        ApplicationId: Text;
        Cluster: Enum "obc TTS Cluster Address";
        APIVersion: Enum "obc TTS API GetDevices";

}
