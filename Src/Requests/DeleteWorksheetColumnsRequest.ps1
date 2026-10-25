# DeleteWorksheetColumnsRequest — Delete worksheet columns in the worksheet.
class DeleteWorksheetColumnsRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ColumnIndex
    [int32]$Columns
    [bool]$UpdateReference

    [string]$Folder
    [string]$StorageName

    DeleteWorksheetColumnsRequest([string]$name, [string]$sheetName, [int32]$columnIndex, [int32]$columns, [bool]$updateReference) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ColumnIndex = $columnIndex
        $this.Columns = $columns
        $this.UpdateReference = $updateReference
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/columns/{columnIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{columnIndex}', [Uri]::EscapeDataString([string]$this.ColumnIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['columns'] = $this.Columns
        $q['updateReference'] = $this.UpdateReference
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
