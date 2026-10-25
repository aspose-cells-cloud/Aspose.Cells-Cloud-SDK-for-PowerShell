# PostUngroupWorksheetRowsRequest — Ungroup rows in the worksheet.
class PostUngroupWorksheetRowsRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$FirstIndex
    [int32]$LastIndex

    [Nullable[bool]]$IsAll
    [string]$Folder
    [string]$StorageName

    PostUngroupWorksheetRowsRequest([string]$name, [string]$sheetName, [int32]$firstIndex, [int32]$lastIndex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.FirstIndex = $firstIndex
        $this.LastIndex = $lastIndex
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/rows/ungroup'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['firstIndex'] = $this.FirstIndex
        $q['lastIndex'] = $this.LastIndex
        if ($null -ne $this.IsAll) { $q['isAll'] = $this.IsAll }
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
