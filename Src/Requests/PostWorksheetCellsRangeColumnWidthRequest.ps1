# PostWorksheetCellsRangeColumnWidthRequest — Set the column width of the specified range.
class PostWorksheetCellsRangeColumnWidthRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [Range]$Range
    [double]$Value

    [string]$Folder
    [string]$StorageName

    PostWorksheetCellsRangeColumnWidthRequest([string]$name, [string]$sheetName, [Range]$range, [double]$value) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $range) { throw [System.ArgumentException]::new('range is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Range = $range
        $this.Value = $value
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/ranges/columnWidth'
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
        return $this.Range
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
