# PostAutofitWorksheetRowRequest — Autofit a row in the worksheet.
class PostAutofitWorksheetRowRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$RowIndex

    [Nullable[int32]]$FirstColumn
    [Nullable[int32]]$LastColumn
    [string]$Folder
    [string]$StorageName
    [Nullable[int32]]$RowCount

    PostAutofitWorksheetRowRequest([string]$name, [string]$sheetName, [int32]$rowIndex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.RowIndex = $rowIndex
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/autofitrow'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['rowIndex'] = $this.RowIndex
        if ($null -ne $this.FirstColumn) { $q['firstColumn'] = $this.FirstColumn }
        if ($null -ne $this.LastColumn) { $q['lastColumn'] = $this.LastColumn }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if ($null -ne $this.RowCount) { $q['rowCount'] = $this.RowCount }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
