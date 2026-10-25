# PostPageSetupRequest — Update page setup in the worksheet.
class PostPageSetupRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [PageSetup]$PageSetup

    [string]$Folder
    [string]$StorageName

    PostPageSetupRequest([string]$name, [string]$sheetName, [PageSetup]$pageSetup) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ($null -eq $pageSetup) { throw [System.ArgumentException]::new('pageSetup is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.PageSetup = $pageSetup
    }

    [string] GetMethod() { return 'POST' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/pagesetup'
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
        return $this.PageSetup
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
