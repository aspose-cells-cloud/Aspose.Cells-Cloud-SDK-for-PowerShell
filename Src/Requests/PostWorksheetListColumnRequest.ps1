# PostWorksheetListColumnRequest — Update list column in list object.
class PostWorksheetListColumnRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ListObjectIndex
    [int32]$ColumnIndex
    [ListColumn]$ListColumn

    [string]$Folder
    [string]$StorageName

    PostWorksheetListColumnRequest([string]$name, [string]$sheetName, [int32]$listObjectIndex, [int32]$columnIndex, [ListColumn]$listColumn) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $listColumn) { throw [System.ArgumentException]::new('listColumn is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ListObjectIndex = $listObjectIndex
        $this.ColumnIndex = $columnIndex
        $this.ListColumn = $listColumn
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/listobjects/{listObjectIndex}/listcolumns/{columnIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{listObjectIndex}', [Uri]::EscapeDataString([string]$this.ListObjectIndex))
        $p = $p.Replace('{columnIndex}', [Uri]::EscapeDataString([string]$this.ColumnIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.ListColumn
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
