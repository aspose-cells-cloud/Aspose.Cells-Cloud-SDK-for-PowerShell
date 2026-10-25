# PostWorksheetListObjectSummarizeWithPivotTableRequest — Create a pivot table with a list object in the worksheet.
class PostWorksheetListObjectSummarizeWithPivotTableRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ListObjectIndex
    [string]$DestsheetName
    [CreatePivotTableRequest]$CreatePivotTableRequest

    [string]$Folder
    [string]$StorageName

    PostWorksheetListObjectSummarizeWithPivotTableRequest([string]$name, [string]$sheetName, [int32]$listObjectIndex, [string]$destsheetName, [CreatePivotTableRequest]$createPivotTableRequest) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($destsheetName)) { throw [System.ArgumentException]::new('destsheetName is required') }
        if ($null -eq $createPivotTableRequest) { throw [System.ArgumentException]::new('createPivotTableRequest is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ListObjectIndex = $listObjectIndex
        $this.DestsheetName = $destsheetName
        $this.CreatePivotTableRequest = $createPivotTableRequest
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/listobjects/{listObjectIndex}/SummarizeWithPivotTable'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{listObjectIndex}', [Uri]::EscapeDataString([string]$this.ListObjectIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['destsheetName'] = $this.DestsheetName
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.CreatePivotTableRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
