# PostWorksheetCellsRangeSortRequest — Perform data sorting around a range of cells.
class PostWorksheetCellsRangeSortRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [RangeSortRequest]$RangeSortRequest

    [string]$Folder
    [string]$StorageName

    PostWorksheetCellsRangeSortRequest([string]$name, [string]$sheetName, [RangeSortRequest]$rangeSortRequest) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $rangeSortRequest) { throw [System.ArgumentException]::new('rangeSortRequest is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.RangeSortRequest = $rangeSortRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/ranges/sort'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.RangeSortRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
