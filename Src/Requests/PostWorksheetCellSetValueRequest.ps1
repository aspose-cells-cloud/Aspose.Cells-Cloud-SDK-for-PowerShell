# PostWorksheetCellSetValueRequest — Set cell value using cell name in the worksheet.
class PostWorksheetCellSetValueRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$CellName

    [string]$Value
    [string]$Type
    [string]$Formula
    [string]$Folder
    [string]$StorageName

    PostWorksheetCellSetValueRequest([string]$name, [string]$sheetName, [string]$cellName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($cellName)) { throw [System.ArgumentException]::new('cellName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.CellName = $cellName
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/{cellName}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{cellName}', [Uri]::EscapeDataString([string]$this.CellName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Value)) { $q['value'] = $this.Value }
        if (-not [string]::IsNullOrEmpty($this.Type)) { $q['type'] = $this.Type }
        if (-not [string]::IsNullOrEmpty($this.Formula)) { $q['formula'] = $this.Formula }
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
