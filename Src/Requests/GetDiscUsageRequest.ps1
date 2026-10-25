# GetDiscUsageRequest
class GetDiscUsageRequest : RequestOption {

    [string]$StorageName

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        return '/v4.0/cells/storage/disc'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
