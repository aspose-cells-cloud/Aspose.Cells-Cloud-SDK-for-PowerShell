# PostUpdateWorksheetZoomRequest — Update the scaling percentage in the worksheet. It should be between 10 and 400.
class PostUpdateWorksheetZoomRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Value

    [string]$Folder
    [string]$StorageName

    PostUpdateWorksheetZoomRequest([string]$name, [string]$sheetName, [int32]$value) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Value = $value
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/zoom'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['value'] = $this.Value
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
