# PostWorkbookNameRequest — Update a named range in the workbook.
class PostWorkbookNameRequest : RequestOption {
    [string]$Name
    [string]$NameName
    [Name]$NewName

    [string]$Folder
    [string]$StorageName

    PostWorkbookNameRequest([string]$name, [string]$nameName, [Name]$newName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($nameName)) { throw [System.ArgumentException]::new('nameName is required') }
        if ($null -eq $newName) { throw [System.ArgumentException]::new('newName is required') }
        $this.Name = $name
        $this.NameName = $nameName
        $this.NewName = $newName
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/names/{nameName}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{nameName}', [Uri]::EscapeDataString([string]$this.NameName))
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
