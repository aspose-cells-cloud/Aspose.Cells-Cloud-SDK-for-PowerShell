# PostProtectRequest — Excel files encryption.
class PostProtectRequest : RequestOption {
    [string]$File
    [ProtectWorkbookRequest]$ProtectWorkbookRequest

    [string]$Password

    PostProtectRequest([string]$File, [ProtectWorkbookRequest]$protectWorkbookRequest) {
        if ([string]::IsNullOrEmpty($File)) { throw [System.ArgumentException]::new('File is required') }
        if ($null -eq $protectWorkbookRequest) { throw [System.ArgumentException]::new('protectWorkbookRequest is required') }
        $this.File = $File
        $this.ProtectWorkbookRequest = $protectWorkbookRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        return '/v3.0/cells/protect'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        return $q
    }
    [object] GetJsonBody() {
        return $this.ProtectWorkbookRequest
    }
    [hashtable] GetMultipartForm() {
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.File)] = $this.File
        return $f
    }
}
