# PutWorksheetDateFilterRequest — Apply a date filter in the worksheet.
class PutWorksheetDateFilterRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Range
    [int32]$FieldIndex
    [string]$DateTimeGroupingType

    [Nullable[int32]]$Year
    [Nullable[int32]]$Month
    [Nullable[int32]]$Day
    [Nullable[int32]]$Hour
    [Nullable[int32]]$Minute
    [Nullable[int32]]$Second
    [Nullable[bool]]$MatchBlanks
    [Nullable[bool]]$Refresh
    [string]$Folder
    [string]$StorageName

    PutWorksheetDateFilterRequest([string]$name, [string]$sheetName, [string]$range, [int32]$fieldIndex, [string]$dateTimeGroupingType) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($dateTimeGroupingType)) { throw [System.ArgumentException]::new('dateTimeGroupingType is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Range = $range
        $this.FieldIndex = $fieldIndex
        $this.DateTimeGroupingType = $dateTimeGroupingType
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/autoFilter/dateFilter'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['range'] = $this.Range
        $q['fieldIndex'] = $this.FieldIndex
        $q['dateTimeGroupingType'] = $this.DateTimeGroupingType
        if ($null -ne $this.Year) { $q['year'] = $this.Year }
        if ($null -ne $this.Month) { $q['month'] = $this.Month }
        if ($null -ne $this.Day) { $q['day'] = $this.Day }
        if ($null -ne $this.Hour) { $q['hour'] = $this.Hour }
        if ($null -ne $this.Minute) { $q['minute'] = $this.Minute }
        if ($null -ne $this.Second) { $q['second'] = $this.Second }
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
