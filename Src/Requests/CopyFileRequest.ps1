# CopyFileRequest
class CopyFileRequest : RequestOption {
    [string]$SrcPath
    [string]$DestPath

    [string]$SrcStorageName
    [string]$DestStorageName
    [string]$VersionId

    CopyFileRequest([string]$srcPath, [string]$destPath) {
        if ([string]::IsNullOrEmpty($srcPath)) { throw [System.ArgumentException]::new('srcPath is required') }
        if ([string]::IsNullOrEmpty($destPath)) { throw [System.ArgumentException]::new('destPath is required') }
        $this.SrcPath = $srcPath
        $this.DestPath = $destPath
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/storage/file/copy/{srcPath}'
        $p = $p.Replace('{srcPath}', [Uri]::EscapeDataString([string]$this.SrcPath))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['destPath'] = $this.DestPath
        if (-not [string]::IsNullOrEmpty($this.SrcStorageName)) { $q['srcStorageName'] = $this.SrcStorageName }
        if (-not [string]::IsNullOrEmpty($this.DestStorageName)) { $q['destStorageName'] = $this.DestStorageName }
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
