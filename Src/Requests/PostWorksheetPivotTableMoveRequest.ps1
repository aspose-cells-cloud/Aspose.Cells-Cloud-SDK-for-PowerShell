# PostWorksheetPivotTableMoveRequest — Move PivotTable in the worksheet.
class PostWorksheetPivotTableMoveRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$PivotTableIndex

    [Nullable[int32]]$Row
    [Nullable[int32]]$Column
    [string]$DestCellName
    [string]$Folder
    [string]$StorageName

    PostWorksheetPivotTableMoveRequest([string]$name, [string]$sheetName, [int32]$pivotTableIndex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PivotTableIndex = $pivotTableIndex
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pivottables/{pivotTableIndex}/Move'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{pivotTableIndex}', [Uri]::EscapeDataString([string]$this.PivotTableIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.Row) { $q['row'] = $this.Row }
        if ($null -ne $this.Column) { $q['column'] = $this.Column }
        if (-not [string]::IsNullOrEmpty($this.DestCellName)) { $q['destCellName'] = $this.DestCellName }
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
