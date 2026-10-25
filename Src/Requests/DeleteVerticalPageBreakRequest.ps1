# DeleteVerticalPageBreakRequest — Delete a vertical page break in the worksheet.
class DeleteVerticalPageBreakRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Index

    [string]$Folder
    [string]$StorageName

    DeleteVerticalPageBreakRequest([string]$name, [string]$sheetName, [int32]$index) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Index = $index
    }

    [string] GetMethod() { return 'DELETE' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/verticalpagebreaks/{index}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{index}', [Uri]::EscapeDataString([string]$this.Index))
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
