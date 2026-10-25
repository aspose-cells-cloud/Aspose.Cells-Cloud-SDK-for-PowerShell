# PostWorksheetRangeSortRequest — Sort a range in the worksheet.
class PostWorksheetRangeSortRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$CellArea
    [DataSorter]$DataSorter

    [string]$Folder
    [string]$StorageName

    PostWorksheetRangeSortRequest([string]$name, [string]$sheetName, [string]$cellArea, [DataSorter]$dataSorter) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($cellArea)) { throw [System.ArgumentException]::new('cellArea is required') }
        if ($null -eq $dataSorter) { throw [System.ArgumentException]::new('dataSorter is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.CellArea = $cellArea
        $this.DataSorter = $dataSorter
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/sort'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['cellArea'] = $this.CellArea
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
