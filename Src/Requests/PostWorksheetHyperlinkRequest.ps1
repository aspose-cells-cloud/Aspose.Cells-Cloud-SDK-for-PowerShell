# PostWorksheetHyperlinkRequest — Update hyperlink by index in the worksheet.
class PostWorksheetHyperlinkRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$HyperlinkIndex
    [Hyperlink]$Hyperlink

    [string]$Folder
    [string]$StorageName

    PostWorksheetHyperlinkRequest([string]$name, [string]$sheetName, [int32]$hyperlinkIndex, [Hyperlink]$hyperlink) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $hyperlink) { throw [System.ArgumentException]::new('hyperlink is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.HyperlinkIndex = $hyperlinkIndex
        $this.Hyperlink = $hyperlink
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/hyperlinks/{hyperlinkIndex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{hyperlinkIndex}', [Uri]::EscapeDataString([string]$this.HyperlinkIndex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        return $q
    }
    [object] GetJsonBody() {
        return $this.Hyperlink
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
