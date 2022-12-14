codeunit 77113 "obc TTS GetStoredAppUpv3" implements "obc TTS IGetStoredAppUp"
{
    Access = Internal;
    procedure GetStoredApplicationUp(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetStoredAppUp", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        UriBuilder: Codeunit "Uri Builder";
        Uri: Codeunit Uri;
        GetStoreAppUpParamenter: Enum "obc TTS Param GetStoredAppUp";
        AuthToken: Text;
    begin
        AuthToken := Parameter.Get(GetStoreAppUpParamenter::"AuthToken");
        Parameter.Remove(GetStoreAppUpParamenter::AuthToken);

        UriBuilder.Init(BuildAPIUrl(Cluster, Parameter));
        UriBuilder.SetQuery(GetQueryString(Parameter));
        UriBuilder.GetUri(Uri);

        if InvokeWebRequest(Uri.GetAbsoluteUri(), AuthToken, HttpResponse) then
            exit(HttpResponse.IsSuccessStatusCode());
    end;

    procedure GetStoredApplicationUp(Cluster: Enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetStoredAppUp", Text]; var JsonResponse: JsonObject): Boolean;
    var
        HttpResponse: HttpResponseMessage;
    begin
        GetStoredApplicationUp(Cluster, Parameter, HttpResponse);
        exit(ProcessHttpResponseMessage(HttpResponse, JsonResponse));
    end;

    local procedure BuildAPIUrl(Cluster: Enum "obc TTS Cluster Address"; var Parameter: Dictionary of [enum "obc TTS Param GetStoredAppUp", Text]): Text
    var
        ICluster: Interface "obc TTS IClusterAddress";
        GetStoreAppParam: Enum "obc TTS Param GetStoredAppUp";
        Uri: text;
        ApplicationUpStorageHttpBindingLbl: Label '/api/v3/as/applications/%1/devices/%2/packages/storage/%3', Locked = true;
        ApplicationUpStorageHttpBindingWithoutDeviceLbl: Label '/api/v3/as/applications/%1/packages/storage/%2', Locked = true;
    begin
        ICluster := Cluster;

        if Parameter.ContainsKey(GetStoreAppParam::end_device_ids) then begin
            Uri := ICluster.GetAPIEndpoint() + StrSubstNo(ApplicationUpStorageHttpBindingLbl,
                Parameter.Get(GetStoreAppParam::application_ids),
                Parameter.Get(GetStoreAppParam::end_device_ids),
                Parameter.Get(GetStoreAppParam::type));

            Parameter.Remove(GetStoreAppParam::application_ids);
            Parameter.Remove(GetStoreAppParam::end_device_ids);
            Parameter.Remove(GetStoreAppParam::type);
        end else begin
            Uri := ICluster.GetAPIEndpoint() + StrSubstNo(ApplicationUpStorageHttpBindingWithoutDeviceLbl,
                Parameter.Get(GetStoreAppParam::application_ids),
                Parameter.Get(GetStoreAppParam::type));

            Parameter.Remove(GetStoreAppParam::application_ids);
            Parameter.Remove(GetStoreAppParam::type);
        end;

        exit(Uri);
    end;

    local procedure GetQueryString(Parameter: Dictionary of [enum "obc TTS Param GetStoredAppUp", Text]): Text
    var
        ParamKeys: List of [Enum "obc TTS Param GetStoredAppUp"];
        GetStoreAppParam: Enum "obc TTS Param GetStoredAppUp";
        TxtBuilder: TextBuilder;
    begin
        ParamKeys := Parameter.Keys;
        foreach GetStoreAppParam in ParamKeys do
            TxtBuilder.Append(GetEnumName(GetStoreAppParam) + '=' + Parameter.Get(GetStoreAppParam) + '&');

        exit(TxtBuilder.ToText().TrimEnd('&'));
    end;

    local procedure GetEnumName(Parameter: Enum "obc TTS Param GetStoredAppUp"): Text
    var
        OrdinalValue: Integer;
        Index: Integer;
    begin
        OrdinalValue := Parameter.AsInteger();
        Index := Parameter.Ordinals.IndexOf(OrdinalValue);
        exit(Parameter.Names.Get(Index));
    end;

    local procedure InvokeWebRequest(Url: Text; AuthToken: Text; var Response: HttpResponseMessage): Boolean
    var
        Client: HttpClient;
    begin
        Client.DefaultRequestHeaders.Clear();
        Client.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + AuthToken);
        Client.DefaultRequestHeaders.Add('Accept', 'text/event-stream');
        exit(Client.Get(Url, Response));
    end;

    local procedure ProcessHttpResponseMessage(Response: HttpResponseMessage; var ResponseJObject: JsonObject) HttpResponse: Boolean;
    var
        Result: Text;
    begin
        Clear(ResponseJObject);
        HttpResponse := Response.IsSuccessStatusCode();

        if Response.Content().ReadAs(Result) then
            if HttpResponse then
                ResponseJObject := BuildResultJObject(Result)
            else
                ResponseJObject.ReadFrom(Result);
    end;

    local procedure BuildResultJObject(Result: Text): JsonObject
    var
        ResultJObject: JsonObject;
        ResultList: List of [Text];
    begin
        ResultList := Result.Split();
        RemoveEmptyEntries(ResultList);
        ResultJObject.Add('results', BuildResultJArray(ResultList));
        exit(ResultJObject);
    end;

    local procedure RemoveEmptyEntries(var ResultList: List of [Text])
    begin
        while ResultList.Remove('') do;
    end;

    local procedure BuildResultJArray(ResultList: List of [Text]): JsonArray;
    var
        ResultJArray: JsonArray;
        JObject: JsonObject;
        Result: Text;
    begin
        foreach Result in ResultList do begin
            JObject.ReadFrom(Result);
            ResultJArray.Add(JObject);
        end;

        exit(ResultJArray);
    end;
}