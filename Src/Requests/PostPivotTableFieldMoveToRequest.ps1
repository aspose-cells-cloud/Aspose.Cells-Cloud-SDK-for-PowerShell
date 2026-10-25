# PostPivotTableFieldMoveToRequest — Move a pivot field in the PivotTable.
class PostPivotTableFieldMoveToRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$PivotTableIndex
    [int32]$FieldIndex
    [string]$From
    [string]$To

    [string]$Folder
    [string]$StorageName

    PostPivotTableFieldMoveToRequest([string]$name, [string]$sheetName, [int32]$pivotTableIndex, [int32]$fieldIndex, [string]$from, [string]$to) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($from)) { throw [System.ArgumentException]::new('from is required') }
        if ([string]::IsNullOrEmpty($to)) { throw [System.ArgumentException]::new('to is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PivotTableIndex = $pivotTableIndex
        $this.FieldIndex = $fieldIndex
        $this.From = $from
        $this.To = $to
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pivottables/{pivotTableIndex}/PivotField/Move'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{pivotTableIndex}', [Uri]::EscapeDataString([string]$this.PivotTableIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['fieldIndex'] = $this.FieldIndex
        $q['from'] = $this.From
        $q['to'] = $this.To
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
