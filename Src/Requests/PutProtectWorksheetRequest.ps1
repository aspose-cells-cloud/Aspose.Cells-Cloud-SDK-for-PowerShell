# PutProtectWorksheetRequest — Protect worksheet.
class PutProtectWorksheetRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [ProtectSheetParameter]$ProtectParameter

    [string]$Folder
    [string]$StorageName

    PutProtectWorksheetRequest([string]$name, [string]$sheetName, [ProtectSheetParameter]$protectParameter) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $protectParameter) { throw [System.ArgumentException]::new('protectParameter is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ProtectParameter = $protectParameter
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/protection'
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
        return $this.ProtectParameter
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
