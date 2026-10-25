# PostRenameWorksheetRequest — Rename worksheet in the workbook.
class PostRenameWorksheetRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Newname

    [string]$Folder
    [string]$StorageName

    PostRenameWorksheetRequest([string]$name, [string]$sheetName, [string]$newname) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($newname)) { throw [System.ArgumentException]::new('newname is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Newname = $newname
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/rename'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['newname'] = $this.Newname
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
