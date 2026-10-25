# DeletePivotTableFieldRequest — Delete a pivot field in the PivotTable.
class DeletePivotTableFieldRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$PivotTableIndex
    [string]$PivotFieldType
    [PivotTableFieldRequest]$PivotTableFieldRequest

    [string]$Folder
    [string]$StorageName

    DeletePivotTableFieldRequest([string]$name, [string]$sheetName, [int32]$pivotTableIndex, [string]$pivotFieldType, [PivotTableFieldRequest]$pivotTableFieldRequest) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($pivotFieldType)) { throw [System.ArgumentException]::new('pivotFieldType is required') }
        if ($null -eq $pivotTableFieldRequest) { throw [System.ArgumentException]::new('pivotTableFieldRequest is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PivotTableIndex = $pivotTableIndex
        $this.PivotFieldType = $pivotFieldType
        $this.PivotTableFieldRequest = $pivotTableFieldRequest
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pivottables/{pivotTableIndex}/PivotField'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{pivotTableIndex}', [Uri]::EscapeDataString([string]$this.PivotTableIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['pivotFieldType'] = $this.PivotFieldType
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.PivotTableFieldRequest
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
