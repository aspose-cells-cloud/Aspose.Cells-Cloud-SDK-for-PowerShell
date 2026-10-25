# GetWorksheetCellsRangeValueRequest — Retrieve the values of cells within the specified range.
class GetWorksheetCellsRangeValueRequest : RequestOption {
    [string]$Name
    [string]$SheetName

    [string]$Namerange
    [Nullable[int32]]$FirstRow
    [Nullable[int32]]$FirstColumn
    [Nullable[int32]]$RowCount
    [Nullable[int32]]$ColumnCount
    [string]$Folder
    [string]$StorageName

    GetWorksheetCellsRangeValueRequest([string]$name, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/ranges/value'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Namerange)) { $q['namerange'] = $this.Namerange }
        if ($null -ne $this.FirstRow) { $q['firstRow'] = $this.FirstRow }
        if ($null -ne $this.FirstColumn) { $q['firstColumn'] = $this.FirstColumn }
        if ($null -ne $this.RowCount) { $q['rowCount'] = $this.RowCount }
        if ($null -ne $this.ColumnCount) { $q['columnCount'] = $this.ColumnCount }
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
