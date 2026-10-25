# DownloadFileRequest
class DownloadFileRequest : RequestOption {
    [string]$Path

    [string]$StorageName
    [string]$VersionId

    DownloadFileRequest([string]$path) {
        if ([string]::IsNullOrEmpty($path)) { throw [System.ArgumentException]::new('path is required') }
        $this.Path = $path
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v4.0/cells/storage/file/{path}'
        $p = $p.Replace('{path}', [Uri]::EscapeDataString([string]$this.Path))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.VersionId)) { $q['versionId'] = $this.VersionId }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
