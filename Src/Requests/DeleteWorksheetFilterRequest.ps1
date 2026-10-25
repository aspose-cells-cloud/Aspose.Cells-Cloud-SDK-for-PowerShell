# DeleteWorksheetFilterRequest — Delete a filter for a column in the worksheet.
class DeleteWorksheetFilterRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$FieldIndex

    [string]$Criteria
    [string]$Folder
    [string]$StorageName

    DeleteWorksheetFilterRequest([string]$name, [string]$sheetName, [int32]$fieldIndex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.FieldIndex = $fieldIndex
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/autoFilter/filter'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['fieldIndex'] = $this.FieldIndex
        if (-not [string]::IsNullOrEmpty($this.Criteria)) { $q['criteria'] = $this.Criteria }
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
