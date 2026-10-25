# StorageExistsRequest
class StorageExistsRequest : RequestOption {
    [string]$StorageName

    StorageExistsRequest([string]$storageName) {
        if ([string]::IsNullOrEmpty($storageName)) { throw [System.ArgumentException]::new('storageName is required') }
        $this.StorageName = $storageName
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v4.0/cells/storage/{storageName}/exist'
        $p = $p.Replace('{storageName}', [Uri]::EscapeDataString([string]$this.StorageName))
        return $p
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
