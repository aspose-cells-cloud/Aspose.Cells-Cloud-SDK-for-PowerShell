# DeleteWorksheetCommentRequest — Delete cell comment in the worksheet.
class DeleteWorksheetCommentRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$CellName

    [string]$Folder
    [string]$StorageName

    DeleteWorksheetCommentRequest([string]$name, [string]$sheetName, [string]$cellName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($cellName)) { throw [System.ArgumentException]::new('cellName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.CellName = $cellName
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/comments/{cellName}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{cellName}', [Uri]::EscapeDataString([string]$this.CellName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
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
