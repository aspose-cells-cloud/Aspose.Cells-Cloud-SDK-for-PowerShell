# RemoveCharactersByPositionInRemoteSpreadsheetRequest — Deletes characters from every cell in the target range by position (first/last N, before/after a substring, or between two delimiters) while preserving formulas, formatting and data-validation.
class RemoveCharactersByPositionInRemoteSpreadsheetRequest : RequestOption {
    [string]$Name
    [string]$Worksheet
    [string]$Range

    [Nullable[int32]]$TheFirstNCharacters
    [Nullable[int32]]$TheLastNCharacters
    [string]$AllCharactersBeforeText
    [string]$AllCharactersAfterText
    [Nullable[bool]]$CaseSensitive
    [string]$Folder
    [string]$StorageName
    [string]$Region
    [string]$Password

    RemoveCharactersByPositionInRemoteSpreadsheetRequest([string]$name, [string]$worksheet, [string]$range) {
        if ([string]::IsNullOrEmpty($name)) { throw [System.ArgumentException]::new('name is required') }
        if ([string]::IsNullOrEmpty($worksheet)) { throw [System.ArgumentException]::new('worksheet is required') }
        if ([string]::IsNullOrEmpty($range)) { throw [System.ArgumentException]::new('range is required') }
        $this.Name = $name
        $this.Worksheet = $worksheet
        $this.Range = $range
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        $p = '/v4.0/cells/{name}/worksheets/{worksheet}/range/{range}/content/remove/characters-by-position'
        $p = $p.Replace('{name}', [Uri]::EscapeDataString([string]$this.Name))
        $p = $p.Replace('{worksheet}', [Uri]::EscapeDataString([string]$this.Worksheet))
        $p = $p.Replace('{range}', [Uri]::EscapeDataString([string]$this.Range))
        return $p
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.TheFirstNCharacters) { $q['theFirstNCharacters'] = $this.TheFirstNCharacters }
        if ($null -ne $this.TheLastNCharacters) { $q['theLastNCharacters'] = $this.TheLastNCharacters }
        if (-not [string]::IsNullOrEmpty($this.AllCharactersBeforeText)) { $q['allCharactersBeforeText'] = $this.AllCharactersBeforeText }
        if (-not [string]::IsNullOrEmpty($this.AllCharactersAfterText)) { $q['allCharactersAfterText'] = $this.AllCharactersAfterText }
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
