# ExtractTextRequest — Indicates extracting substrings, text characters, and numbers from a spreadsheet cell into another cell without having to use complex FIND, MIN, LEFT, or RIGHT formulas.
class ExtractTextRequest : RequestOption {
    [string]$Spreadsheet
    [string]$ExtractTextType
    [string]$OutPositionRange

    [string]$BeforeText
    [string]$AfterText
    [Nullable[int32]]$BeforePosition
    [Nullable[int32]]$AfterPosition
    [string]$Worksheet
    [string]$Range
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    ExtractTextRequest([string]$Spreadsheet, [string]$extractTextType, [string]$outPositionRange) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($extractTextType)) { throw [System.ArgumentException]::new('extractTextType is required') }
        if ([string]::IsNullOrEmpty($outPositionRange)) { throw [System.ArgumentException]::new('outPositionRange is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.ExtractTextType = $extractTextType
        $this.OutPositionRange = $outPositionRange
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/content/extract/text'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['extractTextType'] = $this.ExtractTextType
        $q['outPositionRange'] = $this.OutPositionRange
        if (-not [string]::IsNullOrEmpty($this.BeforeText)) { $q['beforeText'] = $this.BeforeText }
        if (-not [string]::IsNullOrEmpty($this.AfterText)) { $q['afterText'] = $this.AfterText }
        if ($null -ne $this.BeforePosition) { $q['beforePosition'] = $this.BeforePosition }
        if ($null -ne $this.AfterPosition) { $q['afterPosition'] = $this.AfterPosition }
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
