# CreateFolderRequest
class CreateFolderRequest : RequestOption {
    [string]$Path

    [string]$StorageName

    CreateFolderRequest([string]$path) {
        if ([string]::IsNullOrEmpty($path)) { throw [System.ArgumentException]::new('path is required') }
        $this.Path = $path
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/storage/folder/{path}'
        $p = $p.Replace('{path}', [Uri]::EscapeDataString([string]$this.Path))
        return $p
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
