codeunit 77153 "obc TTS Test GetGateways Test" implements "obc TTS IGetGateways"
{
    procedure GetGateways(Cluster: enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetGateways", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        ClusterAddress: enum "obc TTS Cluster Address";
        Param: Enum "obc TTS Param GetGateways";
    begin
        Assert.AreEqual(Cluster, ClusterAddress::eu1, 'Cluster address should be equal to eu1');
        Assert.IsTrue(Parameter.ContainsKey(Param::AuthToken), 'Parameter should contain AuthToken');

        exit(true);
    end;

    procedure GetGateways(Cluster: enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetGateways", Text]; var JsonResponse: JsonObject): Boolean;
    var
        ClusterAddress: enum "obc TTS Cluster Address";
        Param: Enum "obc TTS Param GetGateways";
    begin
        Assert.AreEqual(Cluster, ClusterAddress::eu1, 'Cluster address should be equal to eu1');
        Assert.IsTrue(Parameter.ContainsKey(Param::AuthToken), 'Parameter should contain AuthToken');

        exit(true);
    end;

    var
        Assert: Codeunit Assert;

}