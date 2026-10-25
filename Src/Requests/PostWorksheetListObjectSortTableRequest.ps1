# PostWorksheetListObjectSortTableRequest — Sort list object in the worksheet.
class PostWorksheetListObjectSortTableRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ListObjectIndex
    [DataSorter]$DataSorter

    [string]$Folder
    [string]$StorageName

    PostWorksheetListObjectSortTableRequest([string]$name, [string]$sheetName, [int32]$listObjectIndex, [DataSorter]$dataSorter) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $dataSorter) { throw [System.ArgumentException]::new('dataSorter is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ListObjectIndex = $listObjectIndex
        $this.DataSorter = $dataSorter
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/listobjects/{listObjectIndex}/sort'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{listObjectIndex}', [Uri]::EscapeDataString([string]$this.ListObjectIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.DataSorter
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
