# GetWorksheetCellRequest — Retrieve cell data using either cell reference or method name in the worksheet.
class GetWorksheetCellRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$CellOrMethodName

    [string]$Folder
    [string]$StorageName

    GetWorksheetCellRequest([string]$name, [string]$sheetName, [string]$cellOrMethodName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($cellOrMethodName)) { throw [System.ArgumentException]::new('cellOrMethodName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.CellOrMethodName = $cellOrMethodName
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/{cellOrMethodName}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{cellOrMethodName}', [Uri]::EscapeDataString([string]$this.CellOrMethodName))
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
