# GetWorksheetListObjectRequest — Retrieve list object description by index in the worksheet.
class GetWorksheetListObjectRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Listobjectindex

    [string]$Format
    [string]$Folder
    [string]$StorageName

    GetWorksheetListObjectRequest([string]$name, [string]$sheetName, [int32]$listobjectindex) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Listobjectindex = $listobjectindex
    }

    [string] GetMethod() { return 'GET' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/listobjects/{listobjectindex}'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        $p = $p.Replace('{listobjectindex}', [Uri]::EscapeDataString([string]$this.Listobjectindex))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Format)) { $q['format'] = $this.Format }
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
