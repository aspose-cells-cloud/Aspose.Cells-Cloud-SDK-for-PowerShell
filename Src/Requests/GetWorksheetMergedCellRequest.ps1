# GetWorksheetMergedCellRequest — Retrieve description of a merged cell by its index in the worksheet.
class GetWorksheetMergedCellRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$MergedCellIndex

    [string]$Folder
    [string]$StorageName

    GetWorksheetMergedCellRequest([string]$name, [string]$sheetName, [int32]$mergedCellIndex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.MergedCellIndex = $mergedCellIndex
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/mergedCells/{mergedCellIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{mergedCellIndex}', [Uri]::EscapeDataString([string]$this.MergedCellIndex))
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
