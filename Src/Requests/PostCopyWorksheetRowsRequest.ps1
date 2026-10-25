# PostCopyWorksheetRowsRequest — Copy data and formats from specific entire rows in the worksheet.
class PostCopyWorksheetRowsRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$SourceRowIndex
    [int32]$DestinationRowIndex
    [int32]$RowNumber

    [string]$Worksheet
    [string]$Folder
    [string]$StorageName

    PostCopyWorksheetRowsRequest([string]$name, [string]$sheetName, [int32]$sourceRowIndex, [int32]$destinationRowIndex, [int32]$rowNumber) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.SourceRowIndex = $sourceRowIndex
        $this.DestinationRowIndex = $destinationRowIndex
        $this.RowNumber = $rowNumber
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/rows/copy'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['sourceRowIndex'] = $this.SourceRowIndex
        $q['destinationRowIndex'] = $this.DestinationRowIndex
        $q['rowNumber'] = $this.RowNumber
        if (-not [string]::IsNullOrEmpty($this.Worksheet)) { $q['worksheet'] = $this.Worksheet }
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
