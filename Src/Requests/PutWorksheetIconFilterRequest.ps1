# PutWorksheetIconFilterRequest — Add an icon filter in the worksheet.
class PutWorksheetIconFilterRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Range
    [int32]$FieldIndex
    [string]$IconSetType
    [int32]$IconId

    [Nullable[bool]]$MatchBlanks
    [Nullable[bool]]$Refresh
    [string]$Folder
    [string]$StorageName

    PutWorksheetIconFilterRequest([string]$name, [string]$sheetName, [string]$range, [int32]$fieldIndex, [string]$iconSetType, [int32]$iconId) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($iconSetType)) { throw [System.ArgumentException]::new('iconSetType is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Range = $range
        $this.FieldIndex = $fieldIndex
        $this.IconSetType = $iconSetType
        $this.IconId = $iconId
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/autoFilter/iconFilter'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['range'] = $this.Range
        $q['fieldIndex'] = $this.FieldIndex
        $q['iconSetType'] = $this.IconSetType
        $q['iconId'] = $this.IconId
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
