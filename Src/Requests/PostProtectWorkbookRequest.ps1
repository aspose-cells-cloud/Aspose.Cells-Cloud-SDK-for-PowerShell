# PostProtectWorkbookRequest — Excel protection.
class PostProtectWorkbookRequest : RequestOption {
    [string]$Name
    [ProtectWorkbookRequest]$ProtectWorkbookRequest

    [string]$Folder
    [string]$StorageName

    PostProtectWorkbookRequest([string]$name, [ProtectWorkbookRequest]$protectWorkbookRequest) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $protectWorkbookRequest) { throw [System.ArgumentException]::new('protectWorkbookRequest is required') }
        $this.Name = $name
        $this.ProtectWorkbookRequest = $protectWorkbookRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/protection'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.ProtectWorkbookRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
