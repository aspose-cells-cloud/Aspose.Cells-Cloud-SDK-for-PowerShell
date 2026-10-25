# SplitTextRequest — Indicates performing text segmentation on the specified area according to the segmentation method, and outputting to the designated interval.
class SplitTextRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Delimiters

    [Nullable[bool]]$KeepDelimitersInResultingCells
    [string]$KeepDelimitersPosition
    [string]$HowToSplit
    [string]$OutPositionRange
    [string]$Worksheet
    [string]$Range
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    SplitTextRequest([string]$Spreadsheet, [string]$delimiters) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($delimiters)) { throw [System.ArgumentException]::new('delimiters is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Delimiters = $delimiters
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/content/split/text'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['delimiters'] = $this.Delimiters
        if ($null -ne $this.KeepDelimitersInResultingCells) { $q['keepDelimitersInResultingCells'] = $this.KeepDelimitersInResultingCells }
        if (-not [string]::IsNullOrEmpty($this.KeepDelimitersPosition)) { $q['keepDelimitersPosition'] = $this.KeepDelimitersPosition }
        if (-not [string]::IsNullOrEmpty($this.HowToSplit)) { $q['HowToSplit'] = $this.HowToSplit }
        if (-not [string]::IsNullOrEmpty($this.OutPositionRange)) { $q['outPositionRange'] = $this.OutPositionRange }
        if (-not [string]::IsNullOrEmpty($this.Worksheet)) { $q['worksheet'] = $this.Worksheet }
        if (-not [string]::IsNullOrEmpty($this.Range)) { $q['range'] = $this.Range }
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
