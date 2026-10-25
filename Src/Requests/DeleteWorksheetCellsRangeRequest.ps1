# DeleteWorksheetCellsRangeRequest — Delete a range of cells and shift existing cells based on the specified shift option.
class DeleteWorksheetCellsRangeRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Range
    [string]$Shift

    [string]$Folder
    [string]$StorageName

    DeleteWorksheetCellsRangeRequest([string]$name, [string]$sheetName, [string]$range, [string]$shift) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($shift)) { throw [System.ArgumentException]::new('shift is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Range = $range
        $this.Shift = $shift
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/ranges'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['range'] = $this.Range
        $q['shift'] = $this.Shift
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
