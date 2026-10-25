# DeleteDecryptWorkbookRequest — Excel files decryption.
class DeleteDecryptWorkbookRequest : RequestOption {
    [string]$Name
    [WorkbookEncryptionRequest]$Encryption

    [string]$Folder
    [string]$StorageName

    DeleteDecryptWorkbookRequest([string]$name, [WorkbookEncryptionRequest]$encryption) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $encryption) { throw [System.ArgumentException]::new('encryption is required') }
        $this.Name = $name
        $this.Encryption = $encryption
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/encryption'
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
        return $this.Encryption
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
