# PostUnhideWorksheetColumnsRequest — Unhide worksheet columns in the worksheet.
class PostUnhideWorksheetColumnsRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$StartColumn
    [int32]$TotalColumns

    [Nullable[double]]$Width
    [string]$Folder
    [string]$StorageName

    PostUnhideWorksheetColumnsRequest([string]$name, [string]$sheetName, [int32]$startColumn, [int32]$totalColumns) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.StartColumn = $startColumn
        $this.TotalColumns = $totalColumns
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/columns/unhide'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['startColumn'] = $this.StartColumn
        $q['totalColumns'] = $this.TotalColumns
        if ($null -ne $this.Width) { $q['width'] = $this.Width }
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
