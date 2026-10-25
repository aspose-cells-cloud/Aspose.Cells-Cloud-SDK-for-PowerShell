# PostCopyWorksheetColumnsRequest — Copy data from source columns to destination columns in the worksheet.
class PostCopyWorksheetColumnsRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$SourceColumnIndex
    [int32]$DestinationColumnIndex
    [int32]$ColumnNumber

    [string]$Worksheet
    [string]$Folder
    [string]$StorageName

    PostCopyWorksheetColumnsRequest([string]$name, [string]$sheetName, [int32]$sourceColumnIndex, [int32]$destinationColumnIndex, [int32]$columnNumber) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.SourceColumnIndex = $sourceColumnIndex
        $this.DestinationColumnIndex = $destinationColumnIndex
        $this.ColumnNumber = $columnNumber
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/cells/columns/copy'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['sourceColumnIndex'] = $this.SourceColumnIndex
        $q['destinationColumnIndex'] = $this.DestinationColumnIndex
        $q['columnNumber'] = $this.ColumnNumber
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
