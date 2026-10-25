# DeleteDocumentPropertyRequest — Delete an Excel property.
class DeleteDocumentPropertyRequest : RequestOption {
    [string]$Name
    [string]$PropertyName

    [string]$Type
    [string]$Folder
    [string]$StorageName

    DeleteDocumentPropertyRequest([string]$name, [string]$propertyName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($propertyName)) { throw [System.ArgumentException]::new('propertyName is required') }
        $this.Name = $name
        $this.PropertyName = $propertyName
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/documentproperties/{propertyName}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{propertyName}', [Uri]::EscapeDataString([string]$this.PropertyName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Type)) { $q['type'] = $this.Type }
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
