# PostUpdateWorksheetRowRequest — Update height of rows in the worksheet.
class PostUpdateWorksheetRowRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$RowIndex

    [Nullable[double]]$Height
    [Nullable[int32]]$Count
    [string]$Folder
    [string]$StorageName

    PostUpdateWorksheetRowRequest([string]$name, [string]$sheetName, [int32]$rowIndex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.RowIndex = $rowIndex
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/rows/{rowIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{rowIndex}', [Uri]::EscapeDataString([string]$this.RowIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.Height) { $q['height'] = $this.Height }
        if ($null -ne $this.Count) { $q['count'] = $this.Count }
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
