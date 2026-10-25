# PostWorksheetUngroupShapeRequest — Ungroup shapes in the worksheet.
class PostWorksheetUngroupShapeRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Shapeindex

    [string]$Folder
    [string]$StorageName

    PostWorksheetUngroupShapeRequest([string]$name, [string]$sheetName, [int32]$shapeindex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Shapeindex = $shapeindex
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/shapes/{shapeindex}/ungroup'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{shapeindex}', [Uri]::EscapeDataString([string]$this.Shapeindex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
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
