# PutWorkbookNameRequest — Define a new name in the workbook.
class PutWorkbookNameRequest : RequestOption {
    [string]$Name
    [Name]$NewName

    [string]$Folder
    [string]$StorageName

    PutWorkbookNameRequest([string]$name, [Name]$newName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ($null -eq $newName) { throw [System.ArgumentException]::new('newName is required') }
        $this.Name = $name
        $this.NewName = $newName
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/names'
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
        return $this.NewName
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
