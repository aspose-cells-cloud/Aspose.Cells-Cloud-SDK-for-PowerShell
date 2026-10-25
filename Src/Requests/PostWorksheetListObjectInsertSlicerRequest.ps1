# PostWorksheetListObjectInsertSlicerRequest — Insert slicer for list object.
class PostWorksheetListObjectInsertSlicerRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ListObjectIndex
    [int32]$ColumnIndex
    [string]$DestCellName

    [string]$Folder
    [string]$StorageName

    PostWorksheetListObjectInsertSlicerRequest([string]$name, [string]$sheetName, [int32]$listObjectIndex, [int32]$columnIndex, [string]$destCellName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($destCellName)) { throw [System.ArgumentException]::new('destCellName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ListObjectIndex = $listObjectIndex
        $this.ColumnIndex = $columnIndex
        $this.DestCellName = $destCellName
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/listobjects/{listObjectIndex}/InsertSlicer'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{listObjectIndex}', [Uri]::EscapeDataString([string]$this.ListObjectIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['columnIndex'] = $this.ColumnIndex
        $q['destCellName'] = $this.DestCellName
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
