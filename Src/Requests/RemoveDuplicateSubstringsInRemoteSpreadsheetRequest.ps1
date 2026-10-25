# RemoveDuplicateSubstringsInRemoteSpreadsheetRequest — Finds and removes repeated substrings inside every cell of the chosen range, using user-defined or preset delimiters, while preserving formulas, formatting and data-validation.
class RemoveDuplicateSubstringsInRemoteSpreadsheetRequest : RequestOption {
    [string]$Name
    [string]$Worksheet
    [string]$Range
    [string]$Delimiters

    [Nullable[bool]]$TreatConsecutiveDelimitersAsOne
    [Nullable[bool]]$CaseSensitive
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    RemoveDuplicateSubstringsInRemoteSpreadsheetRequest([string]$name, [string]$worksheet, [string]$range, [string]$delimiters) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        if ([string]::IsNullOrEmpty($delimiters)) { throw [System.ArgumentException]::new('delimiters is required') }
        $this.Name = $name
        $this.Worksheet = $worksheet
        $this.Range = $range
        $this.Delimiters = $delimiters
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/worksheets/{worksheet}/range/{range}/content/remove/duplicate-substrings'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{worksheet}', [Uri]::EscapeDataString([string]$this.Worksheet))
        $p = $p.Replace('{range}', [Uri]::EscapeDataString([string]$this.Range))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        $q['delimiters'] = $this.Delimiters
        if ($null -ne $this.TreatConsecutiveDelimitersAsOne) { $q['treatConsecutiveDelimitersAsOne'] = $this.TreatConsecutiveDelimitersAsOne }
        if ($null -ne $this.CaseSensitive) { $q['caseSensitive'] = $this.CaseSensitive }
        if (-not [string]::IsNullOrEmpty($this.Folder)) { $q['folder'] = $this.Folder }
        if (-not [string]::IsNullOrEmpty($this.StorageName)) { $q['storageName'] = $this.StorageName }
        if (-not [string]::IsNullOrEmpty($this.Region)) { $q['region'] = $this.Region }
        if (-not [string]::IsNullOrEmpty($this.Password)) { $q['password'] = $this.Password }
        return $q
    }
    [object] GetJsonBody() {
        return $null
    }
    [hashtable] GetMultipartForm() {
        return @{}
    }
}
