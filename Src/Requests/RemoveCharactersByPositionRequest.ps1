# RemoveCharactersByPositionRequest — Deletes characters from every cell in the target range by position (first/last N, before/after a substring, or between two delimiters) while preserving formulas, formatting and data-validation.
class RemoveCharactersByPositionRequest : RequestOption {
    [string]$Spreadsheet

    [Nullable[int32]]$TheFirstNCharacters
    [Nullable[int32]]$TheLastNCharacters
    [string]$AllCharactersBeforeText
    [string]$AllCharactersAfterText
    [Nullable[bool]]$CaseSensitive
    [string]$Worksheet
    [string]$Range
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    RemoveCharactersByPositionRequest([string]$Spreadsheet) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        $this.Spreadsheet = $Spreadsheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/content/remove/characters-by-position'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if ($null -ne $this.TheFirstNCharacters) { $q['theFirstNCharacters'] = $this.TheFirstNCharacters }
        if ($null -ne $this.TheLastNCharacters) { $q['theLastNCharacters'] = $this.TheLastNCharacters }
        if (-not [string]::IsNullOrEmpty($this.AllCharactersBeforeText)) { $q['allCharactersBeforeText'] = $this.AllCharactersBeforeText }
        if (-not [string]::IsNullOrEmpty($this.AllCharactersAfterText)) { $q['allCharactersAfterText'] = $this.AllCharactersAfterText }
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
