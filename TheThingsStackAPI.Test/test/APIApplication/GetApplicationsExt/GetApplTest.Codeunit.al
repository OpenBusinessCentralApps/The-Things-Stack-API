codeunit 77151 "obc TTS Test GetAppl. Test" implements "obc TTS IGetApplications"
{

    procedure GetApplications(Cluster: enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetApplications", Text]; var HttpResponse: HttpResponseMessage): Boolean;
    var
        ClusterAddress: enum "obc TTS Cluster Address";
        Param: Enum "obc TTS Param GetApplications";
    begin
        Assert.AreEqual(Cluster, ClusterAddress::eu1, 'Cluster address should be equal to eu1');
        Assert.IsTrue(Parameter.ContainsKey(Param::AuthToken), 'Parameter should contain AuthToken');

        exit(true);
    end;

    procedure GetApplications(Cluster: enum "obc TTS Cluster Address"; Parameter: Dictionary of [enum "obc TTS Param GetApplications", Text]; var JsonResponse: JsonObject): Boolean;
    var
        ClusterAddress: enum "obc TTS Cluster Address";
        Param: Enum "obc TTS Param GetApplications";
    begin
        Assert.AreEqual(Cluster, ClusterAddress::eu1, 'Cluster address should be equal to eu1');
        Assert.IsTrue(Parameter.ContainsKey(Param::AuthToken), 'Parameter should contain AuthToken');

        exit(true);
    end;

    var
        Assert: Codeunit Assert;
}