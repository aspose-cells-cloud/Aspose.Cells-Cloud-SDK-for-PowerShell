# PutWorksheetPivotTableFilterRequest — Add a pivot filter to the PivotTable.
class PutWorksheetPivotTableFilterRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$PivotTableIndex
    [PivotFilter]$Filter

    [Nullable[bool]]$NeedReCalculate
    [string]$Folder
    [string]$StorageName

    PutWorksheetPivotTableFilterRequest([string]$name, [string]$sheetName, [int32]$pivotTableIndex, [PivotFilter]$filter) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $filter) { throw [System.ArgumentException]::new('filter is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PivotTableIndex = $pivotTableIndex
        $this.Filter = $filter
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pivottables/{pivotTableIndex}/PivotFilters'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{pivotTableIndex}', [Uri]::EscapeDataString([string]$this.PivotTableIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.NeedReCalculate) { $q['needReCalculate'] = $this.NeedReCalculate }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Filter
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
