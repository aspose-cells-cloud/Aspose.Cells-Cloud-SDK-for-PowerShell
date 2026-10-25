# PostCopyCellIntoCellRequest — Copy data from a source cell to a destination cell in the worksheet.
class PostCopyCellIntoCellRequest : RequestOption {
    [string]$Name
    [string]$DestCellName
    [string]$SheetName
    [string]$Worksheet

    [string]$Cellname
    [Nullable[int32]]$Row
    [Nullable[int32]]$Column
    [string]$Folder
    [string]$StorageName

    PostCopyCellIntoCellRequest([string]$name, [string]$destCellName, [string]$sheetName, [string]$worksheet) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($destCellName)) { throw [System.ArgumentException]::new('destCellName is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        $this.Name = $name
        $this.DestCellName = $destCellName
        $this.SheetName = $sheetName
        $this.Worksheet = $worksheet
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/{destCellName}/copy'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{destCellName}', [Uri]::EscapeDataString([string]$this.DestCellName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet'] = $this.Worksheet
        if (-not [string]::IsNullOrEmpty($this.Cellname)) { $q['cellname'] = $this.Cellname }
        if ($null -ne $this.Row) { $q['row'] = $this.Row }
        if ($null -ne $this.Column) { $q['column'] = $this.Column }
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
