# DeleteFolderRequest
class DeleteFolderRequest : RequestOption {
    [string]$Path

    [string]$StorageName
    [Nullable[bool]]$Recursive

    DeleteFolderRequest([string]$path) {
        if ([string]::IsNullOrEmpty($path)) { throw [System.ArgumentException]::new('path is required') }
        $this.Path = $path
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v4.0/cells/storage/folder/{path}'
        $p = $p.Replace('{path}', [Uri]::EscapeDataString([string]$this.Path))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if ($null -ne $this.Recursive) { $q['recursive'] = $this.Recursive }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
