# PutInsertNewWorksheetRequest — Insert a new worksheet in the workbook.
class PutInsertNewWorksheetRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [int32]$Index
    [string]$Sheettype

    [string]$Newsheetname
    [string]$Folder
    [string]$StorageName

    PutInsertNewWorksheetRequest([string]$name, [string]$sheetName, [int32]$index, [string]$sheettype) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($sheettype)) { throw [System.ArgumentException]::new('sheettype is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Index = $index
        $this.Sheettype = $sheettype
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/insert'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['sheetName'] = $this.SheetName
        $q['index'] = $this.Index
        $q['sheettype'] = $this.Sheettype
        if (-not [string]::IsNullOrEmpty($this.Newsheetname)) { $q['newsheetname'] = $this.Newsheetname }
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
