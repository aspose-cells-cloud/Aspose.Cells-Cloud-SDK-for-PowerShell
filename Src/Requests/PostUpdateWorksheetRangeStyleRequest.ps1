# PostUpdateWorksheetRangeStyleRequest — Update cell range styles in the worksheet.
class PostUpdateWorksheetRangeStyleRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Range
    [Style]$Style

    [string]$Folder
    [string]$StorageName

    PostUpdateWorksheetRangeStyleRequest([string]$name, [string]$sheetName, [string]$range, [Style]$style) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ($null -eq $style) { throw [System.ArgumentException]::new('style is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Range = $range
        $this.Style = $style
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/style'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['range'] = $this.Range
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Style
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
