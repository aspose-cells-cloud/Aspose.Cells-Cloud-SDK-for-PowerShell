# PutDocumentProtectFromChangesRequest — Excel file write protection.
class PutDocumentProtectFromChangesRequest : RequestOption {
    [string]$Name
    [PasswordRequest]$Password

    [string]$Folder
    [string]$StorageName

    PutDocumentProtectFromChangesRequest([string]$name, [PasswordRequest]$password) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $password) { throw [System.ArgumentException]::new('password is required') }
        $this.Name = $name
        $this.Password = $password
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/writeProtection'
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
        return $this.Password
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
