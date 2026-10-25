# PutWorksheetFreezePanesRequest — Set freeze panes in the worksheet.
class PutWorksheetFreezePanesRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Row
    [int32]$Column
    [int32]$FreezedRows
    [int32]$FreezedColumns

    [string]$Folder
    [string]$StorageName

    PutWorksheetFreezePanesRequest([string]$name, [string]$sheetName, [int32]$row, [int32]$column, [int32]$freezedRows, [int32]$freezedColumns) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Row = $row
        $this.Column = $column
        $this.FreezedRows = $freezedRows
        $this.FreezedColumns = $freezedColumns
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/freezepanes'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['row'] = $this.Row
        $q['column'] = $this.Column
        $q['freezedRows'] = $this.FreezedRows
        $q['freezedColumns'] = $this.FreezedColumns
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
