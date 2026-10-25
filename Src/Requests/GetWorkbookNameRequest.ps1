# GetWorkbookNameRequest — Retrieve description of a named range in the workbook.
class GetWorkbookNameRequest : RequestOption {
    [string]$Name
    [string]$NameName

    [string]$Folder
    [string]$StorageName

    GetWorkbookNameRequest([string]$name, [string]$nameName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($nameName)) { throw [System.ArgumentException]::new('nameName is required') }
        $this.Name = $name
        $this.NameName = $nameName
    }

    [string] GetMethod() { return 'GET' }
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
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
