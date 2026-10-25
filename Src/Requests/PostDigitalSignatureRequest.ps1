# PostDigitalSignatureRequest — Excel file digital signature.
class PostDigitalSignatureRequest : RequestOption {
    [string]$Name
    [string]$Digitalsignaturefile
    [string]$Password

    [string]$Folder
    [string]$StorageName

    PostDigitalSignatureRequest([string]$name, [string]$digitalsignaturefile, [string]$password) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($digitalsignaturefile)) { throw [System.ArgumentException]::new('digitalsignaturefile is required') }
        if ([string]::IsNullOrEmpty($password)) { throw [System.ArgumentException]::new('password is required') }
        $this.Name = $name
        $this.Digitalsignaturefile = $digitalsignaturefile
        $this.Password = $password
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/digitalsignature'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['digitalsignaturefile'] = $this.Digitalsignaturefile
        $q['password'] = $this.Password
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
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
