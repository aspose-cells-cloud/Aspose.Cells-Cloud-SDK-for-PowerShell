# PostWorksheetTextReplaceRequest — Replace old text with new text in the worksheet.
class PostWorksheetTextReplaceRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$OldValue
    [string]$NewValue

    [string]$Folder
    [string]$StorageName

    PostWorksheetTextReplaceRequest([string]$name, [string]$sheetName, [string]$oldValue, [string]$newValue) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($oldValue)) { throw [System.ArgumentException]::new('oldValue is required') }
        if ([string]::IsNullOrEmpty($newValue)) { throw [System.ArgumentException]::new('newValue is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.OldValue = $oldValue
        $this.NewValue = $newValue
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/replaceText'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['oldValue'] = $this.OldValue
        $q['newValue'] = $this.NewValue
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
