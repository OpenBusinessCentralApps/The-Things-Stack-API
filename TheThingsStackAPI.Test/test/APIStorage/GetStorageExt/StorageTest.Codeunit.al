codeunit 77154 "obc TTS Test Storage Test" implements "obc TTS IGetStoredAppUp"
{
    procedure GetStoredApplicationUp(Cluster: enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetStoredAppUp", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        ClusterAddress: enum "obc TTS Cluster Address";
        Param: Enum "obc TTS Param GetStoredAppUp";
    begin
        Assert.AreEqual(Cluster, ClusterAddress::eu1, 'Cluster address should be equal to eu1');
        Assert.IsTrue(Parameter.ContainsKey(Param::AuthToken), 'Parameter should contain AuthToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::application_ids), 'Parameter should contain application_ids');
        Assert.IsTrue(Parameter.ContainsKey(Param::end_device_ids), 'Parameter should contain device_ids');
        Assert.IsTrue(Parameter.ContainsKey(Param::type), 'Parameter should contain type');
        Assert.AreEqual(Parameter.Get(Param::type), 'uplink_message', 'Type should be "uplink_message"');

        exit(true);
    end;

    procedure GetStoredApplicationUp(Cluster: enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetStoredAppUp", Text]; var JsonResponse: JsonObject): Boolean;
    var
        ClusterAddress: enum "obc TTS Cluster Address";
        Param: Enum "obc TTS Param GetStoredAppUp";
    begin
        Assert.AreEqual(Cluster, ClusterAddress::eu1, 'Cluster address should be equal to eu1');
        Assert.IsTrue(Parameter.ContainsKey(Param::AuthToken), 'Parameter should contain AuthToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::application_ids), 'Parameter should contain application_ids');
        Assert.IsTrue(Parameter.ContainsKey(Param::end_device_ids), 'Parameter should contain device_ids');
        Assert.IsTrue(Parameter.ContainsKey(Param::type), 'Parameter should contain type');
        Assert.AreEqual(Parameter.Get(Param::type), 'uplink_message', 'Type should be "uplink_message"');

        exit(true);
    end;

    var
        Assert: Codeunit Assert;
}