# PostPivotTableFieldHideItemRequest — Hide a pivot field item in the PivotTable.
class PostPivotTableFieldHideItemRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$PivotTableIndex
    [string]$PivotFieldType
    [int32]$FieldIndex
    [int32]$ItemIndex
    [bool]$IsHide

    [Nullable[bool]]$NeedReCalculate
    [string]$Folder
    [string]$StorageName

    PostPivotTableFieldHideItemRequest([string]$name, [string]$sheetName, [int32]$pivotTableIndex, [string]$pivotFieldType, [int32]$fieldIndex, [int32]$itemIndex, [bool]$isHide) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($pivotFieldType)) { throw [System.ArgumentException]::new('pivotFieldType is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PivotTableIndex = $pivotTableIndex
        $this.PivotFieldType = $pivotFieldType
        $this.FieldIndex = $fieldIndex
        $this.ItemIndex = $itemIndex
        $this.IsHide = $isHide
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pivottables/{pivotTableIndex}/PivotField/Hide'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{pivotTableIndex}', [Uri]::EscapeDataString([string]$this.PivotTableIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['pivotFieldType'] = $this.PivotFieldType
        $q['fieldIndex'] = $this.FieldIndex
        $q['itemIndex'] = $this.ItemIndex
        $q['isHide'] = $this.IsHide
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
