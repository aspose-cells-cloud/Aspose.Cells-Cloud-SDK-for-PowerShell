# PostPivotTableUpdatePivotFieldRequest — Update pivot field in the PivotTable.
class PostPivotTableUpdatePivotFieldRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$PivotTableIndex
    [int32]$PivotFieldIndex
    [string]$PivotFieldType
    [PivotField]$PivotField

    [Nullable[bool]]$NeedReCalculate
    [string]$Folder
    [string]$StorageName

    PostPivotTableUpdatePivotFieldRequest([string]$name, [string]$sheetName, [int32]$pivotTableIndex, [int32]$pivotFieldIndex, [string]$pivotFieldType, [PivotField]$pivotField) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($pivotFieldType)) { throw [System.ArgumentException]::new('pivotFieldType is required') }
        if ($null -eq $pivotField) { throw [System.ArgumentException]::new('pivotField is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PivotTableIndex = $pivotTableIndex
        $this.PivotFieldIndex = $pivotFieldIndex
        $this.PivotFieldType = $pivotFieldType
        $this.PivotField = $pivotField
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pivottables/{pivotTableIndex}/PivotFields/{pivotFieldIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{pivotTableIndex}', [Uri]::EscapeDataString([string]$this.PivotTableIndex))
        $p = $p.Replace('{pivotFieldIndex}', [Uri]::EscapeDataString([string]$this.PivotFieldIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['pivotFieldType'] = $this.PivotFieldType
        if ($null -ne $this.NeedReCalculate) { $q['needReCalculate'] = $this.NeedReCalculate }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.PivotField
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
