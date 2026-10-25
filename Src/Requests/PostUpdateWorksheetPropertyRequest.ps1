# PostUpdateWorksheetPropertyRequest — Update worksheet properties in the workbook.
class PostUpdateWorksheetPropertyRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [Worksheet]$Sheet

    [string]$Folder
    [string]$StorageName

    PostUpdateWorksheetPropertyRequest([string]$name, [string]$sheetName, [Worksheet]$sheet) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $sheet) { throw [System.ArgumentException]::new('sheet is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Sheet = $sheet
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Sheet
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
