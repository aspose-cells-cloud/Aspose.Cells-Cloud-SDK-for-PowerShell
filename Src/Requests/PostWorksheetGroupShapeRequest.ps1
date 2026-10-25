# PostWorksheetGroupShapeRequest — Group shapes in the worksheet.
class PostWorksheetGroupShapeRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32[]]$ListShape

    [string]$Folder
    [string]$StorageName

    PostWorksheetGroupShapeRequest([string]$name, [string]$sheetName, [int32[]]$listShape) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ListShape = $listShape
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/shapes/group'
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
        return $this.ListShape
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
