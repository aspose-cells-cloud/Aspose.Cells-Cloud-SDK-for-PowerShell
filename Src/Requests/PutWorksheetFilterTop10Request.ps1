# PutWorksheetFilterTop10Request — Filter the top 10 items in the list in the worksheet.
class PutWorksheetFilterTop10Request : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Range
    [int32]$FieldIndex
    [bool]$IsTop
    [bool]$IsPercent
    [int32]$ItemCount

    [Nullable[bool]]$MatchBlanks
    [Nullable[bool]]$Refresh
    [string]$Folder
    [string]$StorageName

    PutWorksheetFilterTop10Request([string]$name, [string]$sheetName, [string]$range, [int32]$fieldIndex, [bool]$isTop, [bool]$isPercent, [int32]$itemCount) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Range = $range
        $this.FieldIndex = $fieldIndex
        $this.IsTop = $isTop
        $this.IsPercent = $isPercent
        $this.ItemCount = $itemCount
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/autoFilter/filterTop10'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['range'] = $this.Range
        $q['fieldIndex'] = $this.FieldIndex
        $q['isTop'] = $this.IsTop
        $q['isPercent'] = $this.IsPercent
        $q['itemCount'] = $this.ItemCount
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
