# PostAutofitWorksheetColumnsRequest — Autofit columns in the worksheet.
class PostAutofitWorksheetColumnsRequest : RequestOption {
    [string]$Name
    [string]$SheetName

    [Nullable[int32]]$StartColumn
    [Nullable[int32]]$EndColumn
    [Nullable[bool]]$OnlyAuto
    [string]$Folder
    [string]$StorageName

    PostAutofitWorksheetColumnsRequest([string]$name, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/autofitcolumns'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.StartColumn) { $q['startColumn'] = $this.StartColumn }
        if ($null -ne $this.EndColumn) { $q['endColumn'] = $this.EndColumn }
        if ($null -ne $this.OnlyAuto) { $q['onlyAuto'] = $this.OnlyAuto }
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
