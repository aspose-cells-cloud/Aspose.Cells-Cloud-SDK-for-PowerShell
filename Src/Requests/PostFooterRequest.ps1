# PostFooterRequest — Update page footer in the worksheet.
class PostFooterRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Section
    [string]$Script
    [bool]$IsFirstPage

    [string]$Folder
    [string]$StorageName

    PostFooterRequest([string]$name, [string]$sheetName, [int32]$section, [string]$script, [bool]$isFirstPage) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($script)) { throw [System.ArgumentException]::new('script is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Section = $section
        $this.Script = $script
        $this.IsFirstPage = $isFirstPage
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pagesetup/footer'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['section'] = $this.Section
        $q['script'] = $this.Script
        $q['isFirstPage'] = $this.IsFirstPage
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
