# PostPivotTableCellStyleRequest — Update cell style in the PivotTable.
class PostPivotTableCellStyleRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$PivotTableIndex
    [int32]$Column
    [int32]$Row
    [Style]$Style

    [Nullable[bool]]$NeedReCalculate
    [string]$Folder
    [string]$StorageName

    PostPivotTableCellStyleRequest([string]$name, [string]$sheetName, [int32]$pivotTableIndex, [int32]$column, [int32]$row, [Style]$style) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $style) { throw [System.ArgumentException]::new('style is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PivotTableIndex = $pivotTableIndex
        $this.Column = $column
        $this.Row = $row
        $this.Style = $style
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pivottables/{pivotTableIndex}/Format'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{pivotTableIndex}', [Uri]::EscapeDataString([string]$this.PivotTableIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['column'] = $this.Column
        $q['row'] = $this.Row
        if ($null -ne $this.NeedReCalculate) { $q['needReCalculate'] = $this.NeedReCalculate }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Style
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
