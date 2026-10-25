# PutWorksheetPivotTableRequest — Add a PivotTable in the worksheet.
class PutWorksheetPivotTableRequest : RequestOption {
    [string]$Name
    [string]$SheetName

    [string]$Folder
    [string]$SourceData
    [string]$DestCellName
    [string]$TableName
    [Nullable[bool]]$UseSameSource
    [string]$StorageName

    PutWorksheetPivotTableRequest([string]$name, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pivottables'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.SourceData)) { $q['sourceData'] = $this.SourceData }
        if (-not [string]::IsNullOrEmpty($this.DestCellName)) { $q['destCellName'] = $this.DestCellName }
        if (-not [string]::IsNullOrEmpty($this.TableName)) { $q['tableName'] = $this.TableName }
        if ($null -ne $this.UseSameSource) { $q['useSameSource'] = $this.UseSameSource }
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
