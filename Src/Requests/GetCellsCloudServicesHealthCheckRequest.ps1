# GetCellsCloudServicesHealthCheckRequest — Retrieve cell descriptions in a specified format.
class GetCellsCloudServicesHealthCheckRequest : RequestOption {

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        return '/v3.0/cells'
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
