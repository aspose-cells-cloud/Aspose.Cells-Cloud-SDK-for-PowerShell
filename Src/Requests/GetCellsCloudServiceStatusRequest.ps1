# GetCellsCloudServiceStatusRequest — Aspose.Cells Cloud service health status check.
class GetCellsCloudServiceStatusRequest : RequestOption {

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        return '/v3.0/cells/status/check'
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
