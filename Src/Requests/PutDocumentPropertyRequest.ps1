# PutDocumentPropertyRequest — Set or add an Excel property.
class PutDocumentPropertyRequest : RequestOption {
    [string]$Name
    [CellsDocumentProperty]$Property

    [string]$Folder
    [string]$StorageName

    PutDocumentPropertyRequest([string]$name, [CellsDocumentProperty]$property) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $property) { throw [System.ArgumentException]::new('property is required') }
        $this.Name = $name
        $this.Property = $property
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/documentproperties'
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
        return $this.Property
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
