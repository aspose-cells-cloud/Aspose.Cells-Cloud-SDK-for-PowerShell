# PostWorksheetValidationRequest — Update a validation by index in the worksheet.
class PostWorksheetValidationRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$ValidationIndex
    [Validation]$Validation

    [string]$Folder
    [string]$StorageName

    PostWorksheetValidationRequest([string]$name, [string]$sheetName, [int32]$validationIndex, [Validation]$validation) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $validation) { throw [System.ArgumentException]::new('validation is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.ValidationIndex = $validationIndex
        $this.Validation = $validation
    }

    [string] GetMethod() { return 'POST' }
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
        return $this.Validation
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
