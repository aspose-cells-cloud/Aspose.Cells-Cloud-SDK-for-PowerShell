# PostUpdateWorksheetCellStyleRequest — Set cell style using cell name in the worksheet.
class PostUpdateWorksheetCellStyleRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$CellName
    [Style]$Style

    [string]$Folder
    [string]$StorageName

    PostUpdateWorksheetCellStyleRequest([string]$name, [string]$sheetName, [string]$cellName, [Style]$style) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($cellName)) { throw [System.ArgumentException]::new('cellName is required') }
        if ($null -eq $style) { throw [System.ArgumentException]::new('style is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.CellName = $cellName
        $this.Style = $style
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/{cellName}/style'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{cellName}', [Uri]::EscapeDataString([string]$this.CellName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
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
