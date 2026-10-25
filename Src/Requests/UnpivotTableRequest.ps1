# UnpivotTableRequest — Switch rows and columns in the spreadsheet.
class UnpivotTableRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Worksheet
    [int32]$Index

    [Nullable[bool]]$SkipEmptyValue
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    UnpivotTableRequest([string]$Spreadsheet, [string]$worksheet, [int32]$index) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Worksheet = $worksheet
        $this.Index = $index
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/unpivot/table'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['worksheet'] = $this.Worksheet
        $q['index'] = $this.Index
        if ($null -ne $this.SkipEmptyValue) { $q['skipEmptyValue'] = $this.SkipEmptyValue }
        if (-not [string]::IsNullOrEmpty($this.OutPath)) { $q['outPath'] = $this.OutPath }
        if (-not [string]::IsNullOrEmpty($this.OutStorageName)) { $q['outStorageName'] = $this.OutStorageName }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        $f = @{}
        $f['@' + [System.IO.Path]::GetFileName($this.Spreadsheet)] = $this.Spreadsheet
        return $f
    }
}
