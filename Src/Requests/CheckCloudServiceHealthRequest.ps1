# CheckCloudServiceHealthRequest — Check the Health Status of Aspose.Cells Cloud Service.
class CheckCloudServiceHealthRequest : RequestOption {

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        return '/v4.0/cells/status/check'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
