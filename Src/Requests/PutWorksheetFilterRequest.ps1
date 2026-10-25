# PutWorksheetFilterRequest — Add a filter for a column in the worksheet.
class PutWorksheetFilterRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Range
    [int32]$FieldIndex
    [string]$Criteria

    [Nullable[bool]]$MatchBlanks
    [Nullable[bool]]$Refresh
    [string]$Folder
    [string]$StorageName

    PutWorksheetFilterRequest([string]$name, [string]$sheetName, [string]$range, [int32]$fieldIndex, [string]$criteria) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($criteria)) { throw [System.ArgumentException]::new('criteria is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Range = $range
        $this.FieldIndex = $fieldIndex
        $this.Criteria = $criteria
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/autoFilter/filter'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['range'] = $this.Range
        $q['fieldIndex'] = $this.FieldIndex
        $q['criteria'] = $this.Criteria
        if ($null -ne $this.MatchBlanks) { $q['matchBlanks'] = $this.MatchBlanks }
        if ($null -ne $this.Refresh) { $q['refresh'] = $this.Refresh }
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
