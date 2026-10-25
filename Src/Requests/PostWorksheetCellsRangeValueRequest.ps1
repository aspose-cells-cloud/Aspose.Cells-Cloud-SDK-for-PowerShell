# PostWorksheetCellsRangeValueRequest — Assign a value to the range; if necessary, the value will be converted to another data type, and the cell's number format will be reset.
class PostWorksheetCellsRangeValueRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [Range]$Range
    [string]$Value

    [Nullable[bool]]$IsConverted
    [Nullable[bool]]$SetStyle
    [string]$Folder
    [string]$StorageName

    PostWorksheetCellsRangeValueRequest([string]$name, [string]$sheetName, [Range]$range, [string]$Value) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $range) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($Value)) { throw [System.ArgumentException]::new('Value is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Range = $range
        $this.Value = $Value
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/ranges/value'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['Value'] = $this.Value
        if ($null -ne $this.IsConverted) { $q['isConverted'] = $this.IsConverted }
        if ($null -ne $this.SetStyle) { $q['setStyle'] = $this.SetStyle }
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
