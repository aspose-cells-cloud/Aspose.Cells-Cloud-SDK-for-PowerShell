# PostWorksheetCellsRangeMoveToRequest — Move the current range to the destination range.
class PostWorksheetCellsRangeMoveToRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [Range]$Range
    [int32]$DestRow
    [int32]$DestColumn

    [string]$Folder
    [string]$StorageName

    PostWorksheetCellsRangeMoveToRequest([string]$name, [string]$sheetName, [Range]$range, [int32]$destRow, [int32]$destColumn) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $range) { throw [System.ArgumentException]::new('range is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Range = $range
        $this.DestRow = $destRow
        $this.DestColumn = $destColumn
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/ranges/moveto'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['destRow'] = $this.DestRow
        $q['destColumn'] = $this.DestColumn
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
