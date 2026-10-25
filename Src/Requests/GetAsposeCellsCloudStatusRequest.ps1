# GetAsposeCellsCloudStatusRequest — Check the Health Status of Aspose.Cells Cloud Service.
class GetAsposeCellsCloudStatusRequest : RequestOption {

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        return '/v4.0/cells'
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
