# RemoveDuplicateSubstringsRequest — Finds and removes repeated substrings inside every cell of the chosen range, using user-defined or preset delimiters, while preserving formulas, formatting and data-validation.
class RemoveDuplicateSubstringsRequest : RequestOption {
    [string]$Spreadsheet
    [string]$Delimiters

    [Nullable[bool]]$TreatConsecutiveDelimitersAsOne
    [Nullable[bool]]$CaseSensitive
    [string]$Worksheet
    [string]$Range
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    RemoveDuplicateSubstringsRequest([string]$Spreadsheet, [string]$delimiters) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        if ([string]::IsNullOrEmpty($delimiters)) { throw [System.ArgumentException]::new('delimiters is required') }
        $this.Spreadsheet = $Spreadsheet
        $this.Delimiters = $delimiters
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/content/remove/duplicate-substrings'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['delimiters'] = $this.Delimiters
        if ($null -ne $this.TreatConsecutiveDelimitersAsOne) { $q['treatConsecutiveDelimitersAsOne'] = $this.TreatConsecutiveDelimitersAsOne }
        if ($null -ne $this.CaseSensitive) { $q['caseSensitive'] = $this.CaseSensitive }
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
