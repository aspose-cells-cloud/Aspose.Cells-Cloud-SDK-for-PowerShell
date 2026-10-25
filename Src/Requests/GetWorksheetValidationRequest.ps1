# GetWorksheetValidationRequest — Retrieve a validation by its index in the worksheet.
class GetWorksheetValidationRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ValidationIndex

    [string]$Folder
    [string]$StorageName

    GetWorksheetValidationRequest([string]$name, [string]$sheetName, [int32]$validationIndex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ValidationIndex = $validationIndex
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/validations/{validationIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{validationIndex}', [Uri]::EscapeDataString([string]$this.ValidationIndex))
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
