# PutInsertWorksheetRowsRequest — Insert several new rows in the worksheet.
class PutInsertWorksheetRowsRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Startrow

    [Nullable[int32]]$TotalRows
    [Nullable[bool]]$UpdateReference
    [string]$Folder
    [string]$StorageName

    PutInsertWorksheetRowsRequest([string]$name, [string]$sheetName, [int32]$startrow) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Startrow = $startrow
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/rows/'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['startrow'] = $this.Startrow
        if ($null -ne $this.TotalRows) { $q['totalRows'] = $this.TotalRows }
        if ($null -ne $this.UpdateReference) { $q['updateReference'] = $this.UpdateReference }
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
