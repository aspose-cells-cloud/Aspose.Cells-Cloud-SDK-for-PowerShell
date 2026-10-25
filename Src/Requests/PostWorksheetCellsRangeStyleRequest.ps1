# PostWorksheetCellsRangeStyleRequest — Set the style for the specified range.
class PostWorksheetCellsRangeStyleRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [RangeSetStyleRequest]$RangeOperate

    [string]$Folder
    [string]$StorageName

    PostWorksheetCellsRangeStyleRequest([string]$name, [string]$sheetName, [RangeSetStyleRequest]$rangeOperate) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $rangeOperate) { throw [System.ArgumentException]::new('rangeOperate is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.RangeOperate = $rangeOperate
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/ranges/style'
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
        return $this.RangeOperate
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
