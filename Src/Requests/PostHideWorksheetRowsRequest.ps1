# PostHideWorksheetRowsRequest — Hide rows in worksheet.
class PostHideWorksheetRowsRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Startrow
    [int32]$TotalRows

    [string]$Folder
    [string]$StorageName

    PostHideWorksheetRowsRequest([string]$name, [string]$sheetName, [int32]$startrow, [int32]$totalRows) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Startrow = $startrow
        $this.TotalRows = $totalRows
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/rows/hide'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['startrow'] = $this.Startrow
        $q['totalRows'] = $this.TotalRows
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
