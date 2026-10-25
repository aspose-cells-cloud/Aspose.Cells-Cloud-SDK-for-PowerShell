# PostCopyWorksheetRequest — Copy contents and formats from another worksheet.
class PostCopyWorksheetRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$SourceSheet
    [CopyOptions]$Options

    [string]$SourceWorkbook
    [string]$SourceFolder
    [string]$Folder
    [string]$StorageName

    PostCopyWorksheetRequest([string]$name, [string]$sheetName, [string]$sourceSheet, [CopyOptions]$options) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($sourceSheet)) { throw [System.ArgumentException]::new('sourceSheet is required') }
        if ($null -eq $options) { throw [System.ArgumentException]::new('options is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.SourceSheet = $sourceSheet
        $this.Options = $options
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/copy'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['sourceSheet'] = $this.SourceSheet
        if (-not [string]::IsNullOrEmpty($this.SourceWorkbook)) { $q['sourceWorkbook'] = $this.SourceWorkbook }
        if (-not [string]::IsNullOrEmpty($this.SourceFolder)) { $q['sourceFolder'] = $this.SourceFolder }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Options
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
