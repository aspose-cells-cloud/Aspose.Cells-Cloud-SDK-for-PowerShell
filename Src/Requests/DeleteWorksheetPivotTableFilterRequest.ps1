# DeleteWorksheetPivotTableFilterRequest — Delete a pivot filter in the PivotTable.
class DeleteWorksheetPivotTableFilterRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$PivotTableIndex
    [int32]$FieldIndex

    [Nullable[bool]]$NeedReCalculate
    [string]$Folder
    [string]$StorageName

    DeleteWorksheetPivotTableFilterRequest([string]$name, [string]$sheetName, [int32]$pivotTableIndex, [int32]$fieldIndex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PivotTableIndex = $pivotTableIndex
        $this.FieldIndex = $fieldIndex
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pivottables/{pivotTableIndex}/PivotFilters/{fieldIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{pivotTableIndex}', [Uri]::EscapeDataString([string]$this.PivotTableIndex))
        $p = $p.Replace('{fieldIndex}', [Uri]::EscapeDataString([string]$this.FieldIndex))
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
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
