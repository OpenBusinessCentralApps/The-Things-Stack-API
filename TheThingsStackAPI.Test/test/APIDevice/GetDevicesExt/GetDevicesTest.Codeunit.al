codeunit 50103 "obc TTS Test GetDevices Test" implements "obc TTS IGetDevices"
{
    procedure GetDevices(Cluster: enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetDevices", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        ClusterAddress: enum "obc TTS Cluster Address";
        Param: Enum "obc TTS Param GetDevices";
    begin
        Assert.AreEqual(Cluster, ClusterAddress::eu1, 'Cluster address should be equal to eu1');
        Assert.IsTrue(Parameter.ContainsKey(Param::AuthToken), 'Parameter should contain AuthToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::ApplicationID), 'Parameter should contain ApplicationID');

        exit(true);
    end;

    procedure GetDevices(Cluster: enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetDevices", Text]; var JsonResponse: JsonObject): Boolean;
    var
        ClusterAddress: enum "obc TTS Cluster Address";
        Param: Enum "obc TTS Param GetDevices";
    begin
        Assert.AreEqual(Cluster, ClusterAddress::eu1, 'Cluster address should be equal to eu1');
        Assert.IsTrue(Parameter.ContainsKey(Param::AuthToken), 'Parameter should contain AuthToken');
        Assert.IsTrue(Parameter.ContainsKey(Param::ApplicationID), 'Parameter should contain ApplicationID');

        exit(true);
    end;

    var
        Assert: Codeunit Assert;
}