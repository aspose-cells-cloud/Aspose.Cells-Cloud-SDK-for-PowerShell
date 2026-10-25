# UploadFileRequest
class UploadFileRequest : RequestOption {
    [string]$UploadFiles
    [string]$Path

    [string]$StorageName

    UploadFileRequest([string]$UploadFiles, [string]$path) {
        if ([string]::IsNullOrEmpty($UploadFiles)) { throw [System.ArgumentException]::new('UploadFiles is required') }
        if ([string]::IsNullOrEmpty($path)) { throw [System.ArgumentException]::new('path is required') }
        $this.UploadFiles = $UploadFiles
        $this.Path = $path
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/storage/file/{path}'
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
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.UploadFiles)] = $this.UploadFiles
        return $f
    }
}
