# PutWorksheetHyperlinkRequest — Add hyperlink in the worksheet.
class PutWorksheetHyperlinkRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$FirstRow
    [int32]$FirstColumn
    [int32]$TotalRows
    [int32]$TotalColumns
    [string]$Address

    [string]$Folder
    [string]$StorageName

    PutWorksheetHyperlinkRequest([string]$name, [string]$sheetName, [int32]$firstRow, [int32]$firstColumn, [int32]$totalRows, [int32]$totalColumns, [string]$address) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($address)) { throw [System.ArgumentException]::new('address is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.FirstRow = $firstRow
        $this.FirstColumn = $firstColumn
        $this.TotalRows = $totalRows
        $this.TotalColumns = $totalColumns
        $this.Address = $address
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/hyperlinks'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['firstRow'] = $this.FirstRow
        $q['firstColumn'] = $this.FirstColumn
        $q['totalRows'] = $this.TotalRows
        $q['totalColumns'] = $this.TotalColumns
        $q['address'] = $this.Address
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
