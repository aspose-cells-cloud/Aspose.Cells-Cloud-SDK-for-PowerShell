# RemoveCharactersRequest — Deletes user-defined characters, predefined symbol sets, or any substring from every cell in the chosen range while preserving formulas, formatting and data-validation.
class RemoveCharactersRequest : RequestOption {
    [string]$Spreadsheet

    [string]$RemoveTextMethod
    [string]$CharacterSets
    [string]$RemoveCustomValue
    [Nullable[bool]]$CaseSensitive
    [string]$Worksheet
    [string]$Range
    [string]$OutPath
    [string]$OutStorageName
    [string]$Region
    [string]$Password

    RemoveCharactersRequest([string]$Spreadsheet) {
        if ([string]::IsNullOrEmpty($Spreadsheet)) { throw [System.ArgumentException]::new('Spreadsheet is required') }
        $this.Spreadsheet = $Spreadsheet
    }

    [string] GetMethod() { return 'PUT' }
    [string] GetPath() {
        return '/v4.0/cells/content/remove/characters'
    }
    [hashtable] GetQueryParameters() {
        $q = @{}
        if (-not [string]::IsNullOrEmpty($this.RemoveTextMethod)) { $q['removeTextMethod'] = $this.RemoveTextMethod }
        if (-not [string]::IsNullOrEmpty($this.CharacterSets)) { $q['characterSets'] = $this.CharacterSets }
        if (-not [string]::IsNullOrEmpty($this.RemoveCustomValue)) { $q['removeCustomValue'] = $this.RemoveCustomValue }
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
