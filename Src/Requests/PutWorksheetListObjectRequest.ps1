# PutWorksheetListObjectRequest — Add a ListObject in the worksheet.
class PutWorksheetListObjectRequest : RequestOption {
    [string]$Name
    [string]$SheetName

    [Nullable[int32]]$StartRow
    [Nullable[int32]]$StartColumn
    [Nullable[int32]]$EndRow
    [Nullable[int32]]$EndColumn
    [string]$Folder
    [Nullable[bool]]$HasHeaders
    [string]$DisplayName
    [Nullable[bool]]$ShowTotals
    [string]$StorageName

    PutWorksheetListObjectRequest([string]$name, [string]$sheetName) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/listobjects'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.StartRow) { $q['startRow'] = $this.StartRow }
        if ($null -ne $this.StartColumn) { $q['startColumn'] = $this.StartColumn }
        if ($null -ne $this.EndRow) { $q['endRow'] = $this.EndRow }
        if ($null -ne $this.EndColumn) { $q['endColumn'] = $this.EndColumn }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if ($null -ne $this.HasHeaders) { $q['hasHeaders'] = $this.HasHeaders }
        if (-not [string]::IsNullOrEmpty($this.DisplayName)) { $q['displayName'] = $this.DisplayName }
        if ($null -ne $this.ShowTotals) { $q['showTotals'] = $this.ShowTotals }
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
