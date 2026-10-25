# PutWorksheetCustomFilterRequest — Filter a list with custom criteria in the worksheet.
class PutWorksheetCustomFilterRequest : RequestOption {
    [string]$Name
    [string]$SheetName
    [string]$Range
    [int32]$FieldIndex
    [string]$OperatorType1
    [string]$Criteria1

    [Nullable[bool]]$IsAnd
    [string]$OperatorType2
    [string]$Criteria2
    [Nullable[bool]]$MatchBlanks
    [Nullable[bool]]$Refresh
    [string]$Folder
    [string]$StorageName

    PutWorksheetCustomFilterRequest([string]$name, [string]$sheetName, [string]$range, [int32]$fieldIndex, [string]$operatorType1, [string]$criteria1) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($sheetName)) { throw [System.ArgumentException]::new('sheetName is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($operatorType1)) { throw [System.ArgumentException]::new('operatorType1 is required') }
        if ([string]::IsNullOrEmpty($criteria1)) { throw [System.ArgumentException]::new('criteria1 is required') }
        $this.Name = $name
        $this.SheetName = $sheetName
        $this.Range = $range
        $this.FieldIndex = $fieldIndex
        $this.OperatorType1 = $operatorType1
        $this.Criteria1 = $criteria1
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v3.0/cells/{name}/worksheets/{sheetName}/autoFilter/custom'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{sheetName}', [Uri]::EscapeDataString([string]$this.SheetName))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['range'] = $this.Range
        $q['fieldIndex'] = $this.FieldIndex
        $q['operatorType1'] = $this.OperatorType1
        $q['criteria1'] = $this.Criteria1
        if ($null -ne $this.IsAnd) { $q['isAnd'] = $this.IsAnd }
        if (-not [string]::IsNullOrEmpty($this.OperatorType2)) { $q['operatorType2'] = $this.OperatorType2 }
        if (-not [string]::IsNullOrEmpty($this.Criteria2)) { $q['criteria2'] = $this.Criteria2 }
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
