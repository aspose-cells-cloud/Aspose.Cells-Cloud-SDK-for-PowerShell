# PostWorksheetShapeRequest — Update a shape in the worksheet.
class PostWorksheetShapeRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Shapeindex
    [Shape]$Dto

    [string]$Folder
    [string]$StorageName

    PostWorksheetShapeRequest([string]$name, [string]$sheetName, [int32]$shapeindex, [Shape]$dto) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $dto) { throw [System.ArgumentException]::new('dto is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Shapeindex = $shapeindex
        $this.Dto = $dto
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/shapes/{shapeindex}'
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
        return $this.Dto
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
