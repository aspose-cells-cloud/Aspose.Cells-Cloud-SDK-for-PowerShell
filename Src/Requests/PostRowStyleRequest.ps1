# PostRowStyleRequest — Apply formats to an entire row in the worksheet.
class PostRowStyleRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$RowIndex
    [Style]$Style

    [string]$Folder
    [string]$StorageName

    PostRowStyleRequest([string]$name, [string]$sheetName, [int32]$rowIndex, [Style]$style) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $style) { throw [System.ArgumentException]::new('style is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.RowIndex = $rowIndex
        $this.Style = $style
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/rows/{rowIndex}/style'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{rowIndex}', [Uri]::EscapeDataString([string]$this.RowIndex))
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
