# PutVerticalPageBreakRequest — Add a vertical page break in the worksheet.
class PutVerticalPageBreakRequest : RequestOption {
    [string]$Name
    [string]$SheetName

    [string]$Cellname
    [Nullable[int32]]$Column
    [Nullable[int32]]$Row
    [Nullable[int32]]$StartRow
    [Nullable[int32]]$EndRow
    [string]$Folder
    [string]$StorageName

    PutVerticalPageBreakRequest([string]$name, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/verticalpagebreaks'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.Cellname)) { $q['cellname'] = $this.Cellname }
        if ($null -ne $this.Column) { $q['column'] = $this.Column }
        if ($null -ne $this.Row) { $q['row'] = $this.Row }
        if ($null -ne $this.StartRow) { $q['startRow'] = $this.StartRow }
        if ($null -ne $this.EndRow) { $q['endRow'] = $this.EndRow }
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
